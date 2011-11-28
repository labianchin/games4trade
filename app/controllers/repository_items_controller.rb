class RepositoryItemsController < ApplicationController
  before_filter :authenticate

  def create
    @game = Game.find(params[:id])
    current_user.newRepositoryGame!(@game)
    respond_to do |format|
      format.html { redirect_to @game }
      format.js
    end
  end

  def destroy
    @game = RepositoryItem.find(params[:id]).game
    current_user.removeRepositoryGame!(@game)
    respond_to do |format|
      format.html { redirect_to @game }
      format.js
    end
  end
end
