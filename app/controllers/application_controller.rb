class ApplicationController < ActionController::Base
  include ActionController::Caching::Pages
  self.page_cache_directory = "#{Rails.root.to_s}/public/page_cache"
  
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate
    redirect_to signin_path unless current_user
  end

  helper_method :current_user

end
