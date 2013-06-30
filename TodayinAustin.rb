require 'sinatra'
require 'instagram'
require 'launchy'
require 'foursquare2'
require 'twitter'
require 'CSV'

enable :sessions

Instagram.configure do |config|
  config.client_id = "c0d93fea1d7143b4afc87d086475db67"
  config.client_secret = "8cbaf1e2913241c0b26fd7a51c4221b3"
end

# client = Foursquare2::Client.new(:client_id => '4HXJ1ODZK3BK2E5MI4LDKI2B3PZWCZXEZCFKTOJZ3LSVAQYK', :client_secret => 'ZOM5I1F04LOWSDTDEEHFHRBPS50G4RZBJEKTQUY3DZ2YTHT4')
# pics = Instagram.media_search("30.267981743","-97.764201164",distance:200, limit: 10)
pics = []
def pull_pics(id)
  pics_array = Instagram.location_recent_media(id)
  pics1.each do |pic|
    pics << pic
  end
end

pics2 = Instagram.location_recent_media(92316)
pics3 = Instagram.location_recent_media(1747838)
pics4 = Instagram.location_recent_media(77083)
pics5 = Instagram.location_recent_media(48941)
pics6 = Instagram.location_recent_media(132057)
pics7 = Instagram.location_recent_media(207226)

pics8 = pics1.zip(pics7).flatten.compact
pics9 = pics2.zip(pics6).flatten.compact
pics10 = pics3.zip(pics5).flatten.compact

pics11 = pics8.zip(pics4).flatten.compact
pics12 = pics9.zip(pics10).flatten.compact
pics = pics11.zip(pics12).flatten.compact



# # # Search for a location by lat/lng
# # puts Instagram.location_search("37.7808851","-122.3948632")


## Add a location_id to CSV file
def location_id(id)
	new_location = Instagram.location_search(id)
		new_location.each do |location| 
			CSV.open("locations.csv", "ab") do |csv|
				csv << [location.name, location.id, location.latitude, location.longitude]
			end
		end		 
end

pics.each do |pic|
	puts pic.images.low_resolution.url
	puts 
end

get "/" do
  html = "<h1>Today In Austin</h1>"
  pics.each do |pic|
    html << "<img src='#{pic.images.low_resolution.url}'>"
  end
  html
end

Launchy.open('http://localhost:4567')

