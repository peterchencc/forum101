namespace :dev do

  task :fake => :environment do

    puts "lol...."

    User.delete_all
    Topic.delete_all
    Comment.delete_all

    users = [ ]
    emails = ["peterchencc@gmail.com", "example@gmail.com" ]
    emails.each do |e|
      users << User.create( :email => e, :password => "12345678")
    end

    50.times do |t|
         t=Topic.create(:title => Faker::Lorem.word, :content =>Faker::Lorem.paragraph, :user => users.sample )
    end

  end

end