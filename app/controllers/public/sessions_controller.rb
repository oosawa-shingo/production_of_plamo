class Public::SessionsController < Devise::SessionsController
  def guest_sign_in
    end_user = EndUser.guest
    sign_in end_user
    redirect_to post_plamos_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
