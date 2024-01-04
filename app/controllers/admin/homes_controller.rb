class Admin::HomesController < ApplicationController
  def top
    @post_plamos = PostPlamo.page(params[:page]).per(10)
  end
end
