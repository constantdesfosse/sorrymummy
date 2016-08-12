class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def update_resource(resource, params)
    if current_user.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :photo, :photo_cache, :banneruser, :banneruser_cache, :address, :city, :country, :description)
    devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name, :photo, :photo_cache, :banneruser, :banneruser_cache, :address, :city, :country, :description)
  end
end

# class Users::RegistrationsController < Devise::RegistrationsController

#   before_filter :configure_permitted_parameters

#   protected

#   # my custom fields are :first_name, :last_name
#   def configure_permitted_parameters
#     devise_parameter_sanitizer.for(:sign_up) do |u|
#       u.permit(:first_name, :last_name,
#       :email, :password, :password_confirmation)
#     end
#     devise_parameter_sanitizer.for(:account_update) do |u|
#       u.permit(:first_name,
#         :email, :password, :password_confirmation, :current_password)
#     end
#   end
# end

# class ApplicationController < ActionController::Base
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
#   end
# end
