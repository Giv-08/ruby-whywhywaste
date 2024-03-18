class Restaurants::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_no, :name, :cuisine, :phone_no, :rating, :email, :address, :pickup_start, :pickup_end, :photo ])
  end
end
