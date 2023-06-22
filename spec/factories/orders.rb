FactoryBot.define do
  factory :order do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
  end
end