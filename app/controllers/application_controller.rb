class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #TODO avatar crop bad when size is small
  #TODO add comments to events and mail for usercreator
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    events_path(:state_id => resource.city.state.id, :urban => resource.city.en_name)
  end

  protected

    def set_locale
      if user_signed_in?&&params[:locale].present? && (params[:locale] == 'uk' || params[:locale] == 'ru')
        if params[:locale] != current_user.language
          current_user.language = params[:locale]
          current_user.save
        end
        I18n.locale = current_user.language
      elsif user_signed_in?
        I18n.locale = current_user.language
      elsif params[:locale].present? && (params[:locale] == 'uk' || params[:locale] == 'ru')
        I18n.locale = params[:locale]
        cookies[:locale] = params[:locale]
      elsif cookies[:locale] && (cookies[:locale] == 'uk' || cookies[:locale] == 'ru')
        I18n.locale = cookies[:locale]
      end   
    end

    #def default_url_options(options={})
      #{ :locale => ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
    #end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :about_user, :urban, :language, :avatar_id, :gender, :birthday) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :about_user, :urban, :language, :avatar_id, :gender, :birthday) }
  end
end

