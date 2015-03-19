class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :except => [:index]

  def after_sign_in_path_for(resource)
    user_detail_path(resource)
  end

  protected

  helper_method :current_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :avatar << :firstName << :lastName << :city <<
                                                :address << :state << :zipCode << :phone
    devise_parameter_sanitizer.for(:account_update) << :avatar << :firstName << :lastName << :city <<
                                                       :address << :state << :zipCode << :phone
  end

end
