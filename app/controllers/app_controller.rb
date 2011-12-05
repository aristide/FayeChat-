require 'net/http'

class AppController < ApplicationController
    
    before_filter :logged_in , :except => :login

    def index
    end

    def login
        if params[:user]
            code = params[:user][:code]
            password = params[:user][:password]
            @u = User.authenticate(code,password)
            
            if @u
                session[:user] = @u.id
                session[:name] = @u.name
                flash[:notice] = "Welcome man  :) #{@u.name}"
                publish("/newmember", {:id => @u.id, :name => @u.name ,:enter => true})
                @u.is_connected =true
                @u.connected_at = Time.now
                @u.save
                redirect_to messages_path
            else
                flash[:notice] = "Your are doing  bad stuffs here :("
            end
        end
    end

    def logout
        publish("/newmember",{:id => session[:user] ,:leave => true})
        @u = User.find(session[:user])
        @u.is_connected = false
        @u.connected_at = nil
        @u.save
        session[:user] = nil
        session[:name] = nil
        redirect_to login_path
    end

end
