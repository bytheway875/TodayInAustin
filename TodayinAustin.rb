require 'sinatra'
require 'instagram'

enable :sessions

Instagram.configure do |config|
  config.client_id = "c0d93fea1d7143b4afc87d086475db67"
  config.client_secret = "8cbaf1e2913241c0b26fd7a51c4221b3"
end

# puts Instagram.media_search("30.2669","97.7428",distance:500)

pics = Instagram.location_recent_media(68216812)

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
