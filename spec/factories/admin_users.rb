FactoryGirl.define do
  factory :admin_user do
    email { |n| "#{ n }@tut.by" }
    password '12345678'
    password_confirmation { password }
    sequence(:remember_me)
  end
end