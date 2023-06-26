FactoryBot.define do
  factory :user do
    nickname              {'てすと太郎'}
    email                 {Faker::Internet.email}
    password              { 'abc1234' }
    password_confirmation {password}
    last_name             { 'てすと' }
    first_name            { 'たろう' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'タロウ' }
    date_of_birth         { '1992-08-31' }
  end
end
