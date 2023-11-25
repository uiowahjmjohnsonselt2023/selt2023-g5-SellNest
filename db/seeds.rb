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