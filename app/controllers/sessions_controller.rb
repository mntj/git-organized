class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    binding.pry
    token = params[:oauth_token]
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
