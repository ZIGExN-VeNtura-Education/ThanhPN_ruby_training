class ApplicationController < ActionController::Base

  include SessionHelper
  private

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = "Please login"
    redirect_to login_url
  end
end
