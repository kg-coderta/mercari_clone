FactoryBot.define do
  factory :item do
      name            {"布団"}
      description     {"あったかいよ、ともマン"}
      state           {"未使用"}
      # method          {"らくらくメルカリ便"}
      carriage        {"出品者負担"}
      region          {"大阪府"}
      date            {"1~2日で発送"}
      price           {5000}
      saler_id        {4}
      buyer_id        {10}
  end
end
