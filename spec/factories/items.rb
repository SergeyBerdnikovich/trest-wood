FactoryGirl.define do
  factory :item do
    sequence(:category_id)
    title 'Door'
    description 'very good door'
    sequence(:cost)
    material 'wood'
  end
end