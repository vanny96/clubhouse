class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Logged in as #{user.name}"
      redirect_to user
    else
      flash.now[:error] = "Incorrect email or password"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to signin_path
  end
end
