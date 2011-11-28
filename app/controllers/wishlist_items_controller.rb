class WishlistItemsController < ApplicationController
  before_filter :authenticate

  def create
    @game = Game.find(params[:id])
    current_user.newWishlistGame!(@game)
    respond_to do |format|
      format.html { redirect_to @game }
      format.js
    end
  end

  def destroy
    @game = WishlistItem.find(params[:id]).game
    current_user.removeWishlistGame!(@game)
    respond_to do |format|
      format.html { redirect_to @game }
      format.js
    end
  end
end
