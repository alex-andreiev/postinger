FactoryGirl.define do
  factory :user do
    email 'test@local'
    password '123456'
    password_confirmation '123456'
  end
end
