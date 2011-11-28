class Sell < ActiveRecord::Base
  attr_accessible :repository_item_id, :buyer_id, :description, :value
  belongs_to :repository_item
  belongs_to :user
  validates :repository_item_id, :presence => true
  
  def addBuyer(buyer)
  	self.buyer_id = buyer.id
  end
end
