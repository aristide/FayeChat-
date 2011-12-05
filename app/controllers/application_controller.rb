class ApplicationController < ActionController::Base
    protect_from_forgery
  
  
  helper_method :logged_in
  
  def publish(channel="",data=nil)
    message = {:channel => channel, :data => data}
    uri= URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end 
  
  protected 
  
  def logged_in
    if session[:user].nil?
        redirect_to login_path
        flash[:notice] = ":( el senior Bandi"
    end
  end 
  
end
