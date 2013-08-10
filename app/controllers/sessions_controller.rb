class SessionsController < ApplicationController

  def create
    user = User.validate(params[:user][:email], params[:user][:password])
    if user.nil?
      render :new
    else
      session[:session_token] = user.update_token!
      redirect_to albums_url
    end

  end

  def delete
    user = current_user
    user.update_token!
    session[:session_token] = nil
  end

end
