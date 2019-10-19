require 'faker'


10.times do
  post = post.new
  post.content = Faker::TvShows::DrWho.quote
  post.user = Faker::TvShows::DrWho.character
  post.save
  puts "post from #{post.user} created !"
end
