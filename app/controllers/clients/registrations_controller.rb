class Clients::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
  end

  def sign_up(resource_name, resource)
    #sign_in(resource_name, resource)
  end

  def after_sign_up_path_for(resource)
    '/customers'
  end
end
