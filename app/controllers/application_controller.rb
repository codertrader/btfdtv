class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :clear_cache

  layout 'makeover'

  def clear_cache
    # headers['Last-Modified'] = Time.now.httpdate
	headers['Access-Control-Allow-Origin'] = 'http://btfd.tv,http://www.btfd.tv,http://btfdtv.com,http://www.btfdtv.com,http://btfdtv.org,http://www.btfdtv.org,http://localhost,http://localhost:3000'
	headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
	headers['Access-Control-Request-Method'] = '*'
	headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization' 
  end
 

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
