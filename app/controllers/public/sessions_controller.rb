class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :end_user_state, only: [:create]

  def after_sign_in_path_for(resource)
    post_plamos_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def end_user_state
    @end_user = EndUser.find_by(email: params[:end_user][:email])
  return if !@end_user
    if @end_user.valid_password?(params[:end_user][:password])
      if @end_user.is_active == true
         return if !@end_user
      else
        redirect_to new_end_user_registration_path
      end
    end
  end

  def guest_sign_in
    end_user = EndUser.guest
    sign_in end_user
    redirect_to post_plamos_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
