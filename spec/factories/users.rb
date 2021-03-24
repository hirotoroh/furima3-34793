FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname {Faker::Name.name}
    family_name {"坂本"}
    last_name {"大斗"}
    family_name_kana {"サカモト"}
    last_name_kana {"ヒロト"}
    birth_day {Faker::Date.in_date_period}