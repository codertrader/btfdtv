class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def not_authenticated
    redirect_to login_url, :alert => "Login to access this page."
  end

  def check_admin
      unless current_user.admin
        flash[:error] = "Admin access required."
        redirect_to contributors_path
      end
  end
end
