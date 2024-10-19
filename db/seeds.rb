# Delete previous data
puts "Deleting all trips..."
Trip.destroy_all
puts "Deleting all users..."
User.destroy_all

# Create a user
puts "Creating users..."
user_list = ['john', 'tom', 'jerry']
user_list.each do |name|
  user = User.create!(email: "#{name}@sample.com", password: "123123")
end
puts "#{User.count} users created!"

# Create trips
puts "Creating trips..."
cities = ['Tokyo', 'Kyoto', 'Osaka', 'Hokkaido', 'Okinawa']
description = {
  'Tokyo' => 'Tokyo is the capital of Japan, the center of the Greater Tokyo Area, and the most populous metropolitan area in the world.',
  'Kyoto' => 'Kyoto is a city located in the central part of the island of Honshu, Japan.',
  'Osaka' => 'Osaka is a designated city in the Kansai region of Honshu in Japan.',
  'Hokkaido' => 'Hokkaido is the second largest island of Japan and comprises the largest and northernmost prefecture.',
  'Okinawa' => 'Okinawa is the southernmost prefecture of Japan.'
}
photos ={
  'Tokyo_photo' => ['url', 'url'],
  'Kyoto_photo' => 'url',
  'Osaka_photo' => 'url',
  'Hokkaido_photo' => 'url',
  'Okinawa_photo' => 'url'
}


users.each do |user|
  # Generate a random number of trips for each user (between 1 and 5)
  number_of_trips = rand(1..5)

  number_of_trips.times do
    # Randomly select a city for the trip
    city = cities.sample
    Trip.create!(title: city, description: description[city], user: user)
  end

  # Attach photos to each trip
  2.times do |i|
  
  end
end
