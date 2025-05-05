class AdminController < ApplicationController
  def login
    if request.post?
      if params[:username]== "admin" && params[:password]== "pandu"
        session[:admin] = "admin"
        redirect_to home_index_url
      else 
        flash[:notice] ="Invalid username/password,Try again"
        render :action=> "login",status: :unprocessable_entity
        end
end
end
def logout
  session[:admin] =nil
  flash[:notice] = "You are logged out"
  redirect_to :action=> :login
end
end
