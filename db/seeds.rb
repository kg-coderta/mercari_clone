# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 3.times do |n|
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(nickname: "ともマン",
#                email: email,
#                password: password,
#                password_confirmation: password,
#               )
# end

# Comment.seed do |i|
#   i.id = 1
#   i.text = 'kokjojojojoijijiminnnjnjn'
#   i.item_id = 1
#   i.user_id = 201
# end
# Comment.seed do |i|
#   i.id = 2
#   i.text = 'fsalgkoskagomsofgmogomo'
#   i.item_id = 1
#   i.user_id = 201
# end

# 2.times do |n|
#   Item.create!(name: "布団",
#                description: "あったかいよ、ともマン",
#                state: "未使用",
#                method: "出品者負担",
#                region: "大阪府",
#                date: "1~2日で発送",
#                price: 5000,
#                saler_id: 1,
#                buyer_id: 2,
#               )
# end
2.times do |n|
  Item.create!(name: "ちょニキ",
              description: "あったかいよ、ともマン",
              state: "未使用",
              method: "出品者負担",
              region: "大阪府",
              date: "1~2日で発送",
              price: 5000,
              saler_id: 1,
              buyer_id: 2,
              carriage: "200"
              )

end
