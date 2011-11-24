class User < ActiveRecord::Base

  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  has_many :repository_items, :dependent => :destroy
  has_many :wishlist_items, :dependent => :destroy
  
  has_many :repository_games, :through => :repository_items, :source => :game
  has_many :wishlist_games, :through => :wishlist_items, :source => :game
  
  has_many :reputations, :dependent => :destroy, :foreign_key => "reputed_id"
  
  
	validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
                       
                       

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => true

  before_save :encrypt_password
  
	def self.search(search)
	  if search
		where('name LIKE ?', "%#{search}%")
	  else
		scoped
	  end
	end
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def points
  	pts = 0
  	self.reputations.each{ |reputation| pts=pts+reputation.points }
  	pts
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def hasRepositoryGame?(game)
  	repository_items.find_by_game_id(game.id)
  end

  def hasWishlistGame?(game)
  	wishlist_items.find_by_game_id(game.id)
  end
  
  def newRepositoryGame!(game)
    repository_items.create!(:game_id => game.id)
  end
  
  def newWishlistGame!(game)
    wishlist_items.create!(:game_id => game.id)
  end
  
  def removeRepositoryGame!(game)
  	repository_items.find_by_game_id(game.id).destroy
  end
  
  def removeWishlistGame!(game)
  	wishlist_items.find_by_game_id(game.id).destroy
  end
  
  
  
  private
	def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
