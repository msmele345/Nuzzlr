require 'faker'


10.times do
  user = {:username => Faker::Internet.user_name, :email => Faker::Internet.email, :password => "password"}

  User.create!(user)
end



10.times do
  animal = {:name => Faker::Name.first_name, :species => Faker::Cat.breed, :image_url => Faker::Avatar.image("my-own-slug", "50x50"), :uploaded_owner_id => rand(1..5), :nuzzle_count => rand(1..50)}

  Animal.create!(animal)
end

10.times do
  nuzzle = {:owner_id => rand(1..5), :animal_id => rand(1..5)}

  Nuzzle.create!(nuzzle)
end