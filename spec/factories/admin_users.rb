FactoryGirl.define do
  factory :admin_user do
    name 'Misha'
    email { |n| "#{ n }@tut.by" }
    password '12345678'
    password_confirmation { password }
    sequence(:remember_me)
  end
end