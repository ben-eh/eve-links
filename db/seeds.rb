# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# category_count = @categories.last.id
# puts category_count

# destroy all links and categories
# Link.destroy_all
# Category.destroy_all

# recreate categories - there are 9
category_names = ["Essential", "Travel", "PVE", "PvP", "Market, P.I. and Production", "General", "Exploration", "Wormholes", "TEST"]
category_names.each { |info| Category.create!(name: info, user_id: @user.id) }
# @user = current_user

last_category =  Category.last.id

# recreate links
links_attributes = [
  {
    name: "zkillboard",
    url: "https://zkillboard.com/",
    category_id: last_category - 8
  },
  {
    name: "Thera Map",
    url: "https://www.eve-scout.com/thera/map/",
    category_id: last_category - 7
  }
]

# categories_attributes.each { |params| Category.create!(params) }
links_attributes.each { |params| Link.create!(params) }
