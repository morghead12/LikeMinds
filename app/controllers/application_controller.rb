class ApplicationController < ActionController::Base
  respond_to :html, :json

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :except => [:index]

  helper_method :current_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :avatar << :firstName << :lastName << :city <<
                                                :address << :state << :zipCode << :phone
    devise_parameter_sanitizer.for(:account_update) << :avatar << :firstName << :lastName << :city <<
                                                       :address << :state << :zipCode << :phone
  end

end
