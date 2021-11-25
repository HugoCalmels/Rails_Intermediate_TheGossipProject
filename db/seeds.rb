# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
GossipTag.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all
PolyComment.destroy_all

10.times do 
  c = City.create( 
    name: Faker::WorldCup.city,
    zip_code: Faker::Address.zip
  )
end

10.times do  
  u = User.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.middle_name, 
    description: Faker::Lorem.paragraph_by_chars(number: 80, supplemental: false),
    email: Faker::Internet.email,
    age: rand(9..69),
    city: City.all.sample,
    password: "123123",
    password_confirmation: "123123"
  )
end

10.times do 
  l = Like.create(
    user: User.all.sample
  )
end

10.times do
  t = Tag.create(
    title: Faker::Lorem.paragraph_by_chars(number: 9, supplemental: false),
  )
end

10.times do 
  g = Gossip.create(
    title: Faker::Mountain.name,
    content: Faker::Lorem.paragraph_by_chars(number: 128, supplemental: false),
    user: User.all.sample,
    like_id: Like.all.sample.id
  )
end

10.times do 
  gt = GossipTag.create(
    tag_id: Tag.all.sample.id,
    gossip_id: Gossip.all.sample.id
  )
end

10.times do   
  pm = PrivateMessage.create( 
  content: Faker::Lorem.paragraph_by_chars(number: 30, supplemental: false),
  sender_id: User.all.sample.id,
  recipient_id: User.all.sample.id
  )
end

10.times do
  c = Comment.create(
    content: Faker::Lorem.paragraph_by_chars(number: 30, supplemental: false),
    gossip: Gossip.all.sample,
    user: User.all.sample,
    like: Like.all.sample
  ) 
end

10.times do 
  pc = PolyComment.new(
    content: Faker::Lorem.paragraph_by_chars(number: 30, supplemental: false)
  )
  Comment.all.sample.poly_comments << pc
end


puts "%" * 20
puts "Database filled !"