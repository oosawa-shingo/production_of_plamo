# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :update

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to post_plamos_path, alert: 'ゲストユーザーの更新はできません。'
    end
  end
end
