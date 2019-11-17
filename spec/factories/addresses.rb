FactoryBot.define do

  factory :address do
    user_id          {1}
    postal_code      {"1111111"}
    prefecture_id    {"大阪府"}
    city             {"大阪市中央区"}
    house_number     {"難波５丁目１−６０"}
    phone_number     {"09012345678"}
  end
end
