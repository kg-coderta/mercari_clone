# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.seed do |i|
  i.id = 2
  i.name = "パーカー"
  i.description = "あったかいよ、ともマン"
  i.state = "未使用"
  i.method = "らくらくメルカリ便"
  i.region = "大阪府"
  i.date = "1~2日で発送"
  i.price = 5000
  i.saler_id = 2
  i.buyer_id = nil
  i.carriage = "送料込み(出品者負担)"
  i.category_id = 17
end

Photo.seed do |i|
  i.id = 2
  i.image = "https://we-love-osaka.jp/wp-content/uploads/2018/12/3f2a95e70ac238e92bc631cd00799c34.jpg"
  i.item_id = 2
end