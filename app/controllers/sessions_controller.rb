class SessionsController < ApplicationController

  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    binding.pry
    token = params[:oauth_token]
    binding.pry
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
