# require 'json' # parse url to json to ruby hash
require 'open-uri'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
final_array = []
puts "1. Cleaning the db"
Ingredient.destroy_all
puts "2. Opening Json"
json_string = open(url).read
ruby_hash = JSON.parse(json_string)
puts "3.  creating ingredients"
ruby_hash["drinks"].each do |ingredient_baby_hash|

  final_array << Ingredient.create!(name: ingredient_baby_hash["strIngredient1"])
end
final_array
puts "4. done!"
