FactoryBot.define do
  factory :user do
    name                  {"test"}
    email                 {"test@example"}
    password              {"1q1q1q"}
    password_confirmation {password}
  end
end