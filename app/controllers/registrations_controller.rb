class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if params[:profile_image].present?
      resource.profile_image.attach(params[:profile_image])
    end
    resource.update_without_password(params.except(:profile_image))
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :profile_image)
  end
end
