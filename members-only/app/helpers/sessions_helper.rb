module SessionsHelper
  def sign_in(user)
    token = User.new_token
    cookies.permanent[:token] = token
    user.update_attribute(:remember_token, User.digest(token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    current_user.update_attribute(:remember_token, User.digest(User.new_token))
    cookies.delete(:token)
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    token = User.digest(cookies[:token])
    @current_user || User.find_by(remember_token: token)
  end

  def current_user?
    user == current_user
  end
end
