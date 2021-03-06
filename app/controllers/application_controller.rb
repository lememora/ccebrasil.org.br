# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  helper :all # include all helpers, all the time
  
  before_filter :set_locale
  
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def authenticate
    unless session[:editor_id]
      session[:return_to] = request.request_uri
      redirect_to login_path
    end
  end
  
  def set_locale  
      I18n.locale = session[:locale] || 'pt-BR' 
  end
  
end
