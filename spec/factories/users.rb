FactoryBot.define do

  factory :user do
    id                    {1}
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
  end

end