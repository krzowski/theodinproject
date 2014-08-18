class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception
  include SessionsHelper

  protected
    def authorize
      unless signed_in?
        redirect_to signin_url, notice: "Please log in"
      end
    end

end
