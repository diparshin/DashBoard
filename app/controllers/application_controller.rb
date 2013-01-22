class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale  
  before_filter :set_locale_from_url
  before_filter :redirect_to_default_client_locale
  
  private
  
  def redirect_to_default_client_locale
    unless params[:locale]
      redirect_to '/' + I18n.locale.to_s + url_for(:only_path => true)
    end
  end
  
  def set_locale
    I18n.locale = params[:locale] || ((lang = request.env['HTTP_ACCEPT_LANGUAGE']) && lang[/^[a-z]{2}/])
  end
end
