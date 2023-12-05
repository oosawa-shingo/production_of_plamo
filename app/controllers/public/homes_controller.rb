class Public::HomesController < ApplicationController
  def top
    @post_plamos = PostPlamo.all
  end

  # def guest_sign_in
  #   user = EndUser.find_or_create_by!(email: 'guest@example.com') do |user|
  #     user.password = SecureRandom.urlsafe_base64
  #     user.name = "ゲスト"
  #   end
  #   sign_in user
  #   redirect_to root_path
  # end
end
