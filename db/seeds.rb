# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'


# url = "https://unsplash.com/photos/htQq9bR5_9A"
# cocktail = Cocktail.new(title: 'NES')
# cocktail.remote_photo_url = url
# cocktail.save


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drink_serialized = URI.parse(url).open.read
drink = JSON.parse(drink_serialized)

drink['drinks'].each do |d|
  Ingredient.create(name: d['strIngredient1'])
end
