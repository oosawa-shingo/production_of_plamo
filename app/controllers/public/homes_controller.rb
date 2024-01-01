class Public::HomesController < ApplicationController
  before_action :authenticate_end_user!, except: [:top]
  def top
    @post_plamos = PostPlamo.all
  end
end
