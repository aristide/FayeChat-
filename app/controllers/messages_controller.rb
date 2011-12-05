class MessagesController < ApplicationController
  
  before_filter :logged_in 
  
  def index
    @users = User.order(:connected_at => "DESC").where(:is_connected => true).all
    @messages = Message.find(:all,:order => "id desc", :limit => 20).reverse
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end
  
  def create
    Message.create(:text => params[:message][:text],:user_id => params[:message][:user_id].to_i)
    publish("/newmessage",{:text => params[:message][:text], :user => session[:name]})
  end 
end
