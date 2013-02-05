class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale  
  before_filter :set_locale_from_url
  before_filter :redirect_to_default_client_locale
  
  private
  
  def redirect_to_default_client_locale
    unless params[:locale]
      redirect_to url_for(:only_path => true, :locale => I18n.locale.to_s)
    end
  end
  
  def set_locale
    available = %w{en ru}
    I18n.locale = params[:locale] || http_accept_language.preferred_language_from(available)
  end
end
