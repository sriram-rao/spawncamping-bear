# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Image.delete_all
puts "Database cleared! Adding new data"
result = WebApi.json! "IEconItems_570", 'GetSchema', 1, ""

#Parsing the JSON file
json = File.read('items_game.json')
$itemh = JSON.parse( json)
$itemh["items_game"]["items"].delete("default")  #Delete the first item cause it is default!

def getRarity(defindex = "")
    item = nil
    item = $itemh["items_game"]["items"][defindex]
    if(!item.nil?)
      if(!item["item_rarity"].nil?)
        return item["item_rarity"].to_s
      else
        return "common"
      end
    else
      return "common"
    end
end


result[:items].each do |item|
	Image.create(item_id: item[:defindex] , url: item[:image_url], item_name: item[:name], rarity: getRarity(item[:defindex].to_s) )
	puts "#{item[:name]} Added successfully -----> #{getRarity(item[:defindex].to_s)}"

end


