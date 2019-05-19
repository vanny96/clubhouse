module SessionsHelper
  #log in user
  def log_in user
    session[:user_id] = user.id
  end

  #returns logged in user
  def current_user
    if session[:user_id]
      current_user ||= User.find_by(id: session[:user_id])
    elsif user = User.find_by(id: cookies.signed[:user_id])
      if user.authenticate?(:remember, cookies[:remember_token])
        log_in user
        current_user ||= user
      end      
    end
  end

  def current_user!
    @current_user = current_user
  end

  #returns true if logged in
  def logged_in?
    !current_user.nil?
  end

  #logs out
  def log_out
    session.delete :user_id
    forget
  end

  #remember the user with cookies
  def remember user
    cookies.permanent.signed[:user_id] = user.id
    user.create_remember_token
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def redirect_back_or path
    if session[:go_to]
      redirect_to session[:go_to]
    elsif
      redirect_to path
    end
  end
end
