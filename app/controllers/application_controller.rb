class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  private
  def after_sign_in_path_for(resource)
    listings_path  # Redirect to the listings page
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
