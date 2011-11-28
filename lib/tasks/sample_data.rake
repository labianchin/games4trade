namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_games
    make_repositories
    make_wishlists
    make_reputations
    make_sells
  end
  desc "Reset all"
  task :redo => :environment do
    #Rake::Task['db:destroy'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:populate'].invoke
  end
end

def make_users
  admin = User.create!(:name => "Example User",
                       :email => "example@railstutorial.org",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    User.create!(:name => Faker::Name.name,
    			 :nickname => "example-#{n+1}",
                 :email => "example-#{n+1}@railstutorial.org",
                 :password => "password",
                 :password_confirmation => "password",
                 :city => Faker::Address.city,
                 :state => Faker::Address.state,
                 :street => Faker::Address.street_name,
                 :zipcode => Faker::Address.zip_code,
                 :phone => Faker::PhoneNumber.phone_number)
  end
end

def make_games
	50.times do
	  Game.create!(:name => Faker::Lorem.sentence(2), :plataform => "Windows x86", :media_type => 'CD', :media_count => 5, :genre => "FPS", :review => Faker::Lorem.sentence(50))
	end
end

def make_wishlists
  games = Game.all
  users = User.all
  users[0..12].each { |user| games[5..9].each { |game| user.newWishlistGame!(game) } }
end

def make_repositories
  games = Game.all
  users = User.all
  users[0..12].each { |user| games[0..4].each { |game| user.newRepositoryGame!(game) } }
end

def make_reputations
  (1..200).each { Reputation.create!(:reputer_id => rand(50)+1, :reputed_id => rand(50)+1, :review => Faker::Lorem.sentence(3), :points => rand(3)-1) }
end

def make_sells
 repositoryItems = RepositoryItem.all
 repositoryItems.each { |repositoryItem| 
 	repositoryItem.sellItem!(:description => Faker::Lorem.sentence(3), :value => 5.0) 		
 	repositoryItem.sell.description = Faker::Lorem.sentence(3)
 	repositoryItem.sell.value = 5.0
 }
end
