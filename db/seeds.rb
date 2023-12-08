# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tags = Tag.create([{ name: 'Art & Crafts'}, { name: 'Beauty & Personal Care'}, { name: 'Books'}, { name: 'Clothing'},
                   { name: 'Electronics'}, { name: 'Furniture'}, { name: 'Health & Fitness'}, { name: 'Home & Kitchen'},
                   { name: 'Sports & Outdoors'}, { name: 'Toys & Games'}])

admin = User.create!(
  email: 'admin@email',
  password: 'adminpass',
  seller: true
)

admin_listing = Listing.create!(
  name: 'admin',
  description: 'admin',
  price: 0.0,
  user: admin
)

users = []
50.times do |i|
  created_at = Faker::Date.between(from: 10.days.ago, to: Date.today)
  users << User.create!(
    email: "user#{i + 3}@example.com",
    password: 'password',
    full_name: "User #{i + 3}",
    seller: i.even?,
    created_at: created_at,
  )
end

listings = []
users.each do |user|
  created_at = Faker::Date.between(from: 10.days.ago, to: Date.today)
  tags_to_assign = (1..3).map { rand(1..9) }
  listings << Listing.create!(
    name: "Item for #{user.full_name}",
    description: "Description for Item of #{user.full_name}",
    price: rand(20.0..100.0).round(2),
    user: user,
    tag_ids: tags_to_assign,
    created_at: created_at,
  )
end

# Create Orders
orders = []
users.sample(10).each do |user|
  created_at = Faker::Date.between(from: 10.days.ago, to: Date.today)
  orders << Order.create!(
    user: user,
    total: listings.sample(rand(1..3)).sum(&:price),
    status: 'complete',
    created_at: created_at,
  )
end

# Add Order Items
orders.each do |order|
  order_listings = listings.sample(rand(1..3))
  order_listings.each do |listing|
    OrderItem.create!(order: order, listing: listing, quantity: rand(1..3))
  end
end

# 10.times do
#   user_id = User.pluck(:id).sample  # Replace User with your actual user model
#   total = Faker::Commerce.price(range: 10..500, as_string: false)
#   status = ['complete'].sample
#   created_at = Faker::Date.between(from: 10.days.ago, to: Date.today)
#
#   Order.create(
#     user_id: user_id,
#     total: total,
#     status: status,
#     created_at: created_at,
#     updated_at: created_at
#   )
# end