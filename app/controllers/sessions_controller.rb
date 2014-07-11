class SessionsController < ApplicationController

  def create
    binding.pry
    @user = User.from_omniauth(env["omniauth.auth"])
    token = params[:oauth_token]
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
