class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #TODO link for accept invite to event 
  #TODO link to send invite to user on user_event page
  #TODO set dependent to destroy for plans and events also between users and friendships
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
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :about_user, :urban, :language, :avatar_id, :gender, :birthday) }
  end
end

