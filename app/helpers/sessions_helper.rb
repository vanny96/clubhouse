module SessionsHelper
  #log in user
  def log_in user
    session[:user_id] = user.id
  end

  #returns logged in user
  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  #returns true if logged in
  def logged_in?
    !current_user.nil?
  end

  #logs out
  def log_out
    session.delete :user_id
  end
end
