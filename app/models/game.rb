class Game < ActiveRecord::Base
  has_many :repository_items, :dependent => :destroy
  has_many :wishlist_items, :dependent => :destroy
  
  has_many :repository_users, :through => :repository_items, :source => :user
  has_many :wishlist_users, :through => :wishlist_items, :source => :user

	def self.search(search)
	  if search
    	where('name LIKE ?', "%#{search}%")
	  else
    	scoped
	  end
	end
end
