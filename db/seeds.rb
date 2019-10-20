require 'faker'


# 10.times do
#   post = Post.new
#   post.content = Faker::TvShows::DrWho.quote
#   post.user = Faker::TvShows::DrWho.character
#   post.save
#   puts "post from #{post.user} created !"
# end


10.times do
  session = Session.new
  session.username = "mani"
  session.token = SecureRandom.hex(10)
  if session.save
    puts "#{session.id} created !"
  else
    session.errors.messages
  end
end
