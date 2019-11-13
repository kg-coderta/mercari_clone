3.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(nickname: "ともマン",
               email: email,
               password: password,
               password_confirmation: password,
              )
end
