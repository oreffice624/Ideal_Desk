User.create!(username:  "管理者",
             email: "admin3@example.jp",
             password:  "99999999",
             password_confirmation: "99999999",
             admin: true)




10.times do |n|
 username = Faker::Games::Pokemon.name
 email = Faker::Internet.email
 password = 'password'
 User.create!(
  username: username,
  email: email,
  password: password,
  password_confirmation: password,
  # profile_image_id: open("./db/fixtures/icon#{n}.png")
 )
end

# 10.times do |n|
#   Desk.create(
#       user: User.offset(rand(User.count)).first,
#       title: "タイトル#{n}",
#       body: "本文#{n}"
#       image_id: open("./db/fixtures/icon#{n}.png")
#   )
# end


