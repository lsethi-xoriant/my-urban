class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #TODO make tasks for avatar destroy(wich don't have event)
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

    def set_locale
      if user_signed_in?&&params[:locale].present?
        current_user.language = params[:locale]
        current_user.save
        I18n.locale = current_user.language
      elsif params[:locale].present?
        I18n.locale = params[:locale]
      end       
    end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :about_user, :urban, :language, :avatar_id, :gender, :birthday) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :about_user, :city, :gender, :birthday) }
  end
end

