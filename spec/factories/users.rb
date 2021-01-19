FactoryBot.define do
  factory :user do
    nickname              {Faker::Internet.unique.username}
    email                 {Faker::Internet.unique.email} 
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"ヤマダ"}
    birthday              {"1990-09-31"}
  end
end