require 'faker'


10.times do
  message = Message.new
  message.content = Faker::TvShows::DrWho.quote
  message.sender = Faker::TvShows::DrWho.character
  message.save
  puts "Message from #{message.sender} created !"
end
