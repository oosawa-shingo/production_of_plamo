class Public::HomesController < ApplicationController
  def top
    @post_plamos = PostPlamo.all
  end
end
