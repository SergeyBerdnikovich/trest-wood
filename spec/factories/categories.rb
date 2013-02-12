FactoryGirl.define do
  factory :category do
    title { |n| "#{ n } category" }
  end
end