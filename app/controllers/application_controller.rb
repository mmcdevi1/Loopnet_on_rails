class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Allow Devise to add custom fields in database
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  protected
  def configure_devise_permitted_parameters
    registration_params = [:firstname,
                           :lastname,
                           :username,
                           :admin,
                           :type_of_user, 
                           :email, 
                           :password, 
                           :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :password, 
                                            :password_confirmation, 
                                            :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
  # End Devise #############




  































end
