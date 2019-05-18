class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget
      flash[:success] = "Logged in as #{user.name}"
      redirect_to root_path
    else
      flash.now[:error] = "Incorrect email or password"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
