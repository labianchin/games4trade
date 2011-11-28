class RepositoryItem < ActiveRecord::Base
  attr_accessible :game_id, :user_id
  belongs_to :game
  belongs_to :user
  has_one :sell, :dependent => :destroy
  validates :game_id, :presence => true
  validates :user_id, :presence => true
  
  def sellItem!(params)
    @sell = Sell.create!({:repository_item_id => self.id})
    @sell.attributes.merge(params)
  end
  
  def getGameSell(user, game)
  	item = self.find(:user_id => user.id, :game_id => game.id)
  	item.sell unless item.nil?
  end
  
end
