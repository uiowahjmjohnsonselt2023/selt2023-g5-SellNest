# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tags = Tag.create([{tag: 'Art & Crafts'}, {tag: 'Beauty & Personal Care'}, {tag: 'Books'}, {tag: 'Clothing'},
                   {tag: 'Electronics'}, {tag: 'Furniture'}, {tag: 'Health & Fitness'}, {tag: 'Home & Kitchen'},
                   {tag: 'Sports & Outdoors'}, {tag: 'Toys & Games'}])