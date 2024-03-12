class ApplicationController < ActionController::Base
  before_action :authenticate_user_or_restaurant, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_no, :name, :cuisine, :phone_no, :rating, :email, :address, :pickup_start, :pickup_end ])
  end


  def authenticate_user_or_restaurant
    unless user_signed_in? || restaurant_signed_in?
      redirect_to root_path, alert: 'You must be signed in.'
    end
  end

end
