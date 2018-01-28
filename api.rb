require 'HTTParty'
require 'date'

location = ARGV.first
url = "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=c38d29204353577f04f9a8b861e3c70e"

#Display date and time
dt = HTTParty.get(url)["dt"]
date = Time.at(dt)

#Display the tempurature
kelvin = HTTParty.get(url)["main"]["temp"].to_i
temp = (kelvin * 9/5) - 459.67

#Display the weather
weather = HTTParty.get(url)["weather"][0]["description"]

puts " Date: #{date} \n Temp: #{temp.round} \n Weather: #{weather}"
