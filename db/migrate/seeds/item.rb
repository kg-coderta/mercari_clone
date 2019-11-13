Item.seed do |i|
  i.id = 13
  i.name = "パーカー"
  i.description = "あったかいよ、ともマン"
  i.state = "未使用"
  i.method = "らくらくメルカリ便"
  i.region = "大阪府"
  i.date = "1~2日で発送"
  i.price = 5000
  i.saler_id = 1
  i.buyer_id = nil
  i.carriage = "送料込み(出品者負担)"
  i.category_id = 17
end

Photo.seed do |i|
  i.id = 13
  i.image = "http://img5.zozo.jp/goodsimages/997/15439997/15439997B_18_D_500.jpg"
  i.item_id = 13
end


# 1.times do |n|
#   Item.create!(name: "布団",
#                description: "あったかいよ、ともマン",
#                state: "未使用",
#                method: "らくらくメルカリ便",
#                region: "大阪府",
#                date: "1~2日で発送",
#                price: 5000,
#                saler_id: 1,
#                buyer_id: nil,
#                carriage: "送料込み(出品者負担)",
#                category_id: 549
#               )
# end

# 1.times do |n|
#   Photo.create!(image: "https://www.pokemoncenter-online.com/sp/static/product_image/4521329255392/4521329255392.jpg",
#                 item_id: 2,
#                )
# end
#                buyer_id: 2,
#               )
# end
