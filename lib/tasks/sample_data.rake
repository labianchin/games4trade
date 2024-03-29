namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
   admin = User.create!(:name => "Example Admin",
                         :email => "admin@railstutorial.org",
                         :password => "foobar",
                         :password_confirmation => "foobar",
                         :admin => true)
   admin = User.create!(:name => "Example Admin",
                         :email => "admin@a.com",
                         :password => "foobar",
                         :password_confirmation => "foobar",
                         :admin => true)
 	Game.create!(:name => "Crysis 2")
 	Game.create!(:name => "Portal 2")
 	Game.create!(:name => "Call of Duty: Black Ops First Strike")
 	Game.create!(:name => "Call of Duty: Black Ops")
    
  end
end
