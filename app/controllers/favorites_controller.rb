class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
      @favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
      @favorite.destroy
      redirect_to item_path(@favorite.item)
    else
      @favorite = Favorite.new(user_id: current_user.id, item_id: params[:item_id])
      @favorite.save
      redirect_to item_path(@favorite.item)
    end
  end

end
