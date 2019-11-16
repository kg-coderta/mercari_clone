FactoryBot.define do

  factory :user do
    nickname              {"abechan"}
    email                 {"kkk@gmail.com"}
    password              {"abc0000"}
    password_confirmation {"abc0000"}
    first_name            {"abe"}
    last_name             {"hiroshi"}
    first_name_kana       {"アベ"}
    last_name_kana        {"ヒロシ"}
    birth_year_id         { 1964 }
    birth_month_id        { 6 }
    birth_day_id          { 22 }
  end

end