FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6) +'1a' }
    # password_confirmation {password}
    last_name             {"竹内"}
    first_name            {"亨介"}
    kana_last             {"タケウチ"}
    kana_first            {"キョウスケ"}
    birthday              {"1991-11-20"}
  end
end