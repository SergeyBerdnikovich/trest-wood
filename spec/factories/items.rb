FactoryGirl.define do
  factory :item do
    sequence(:category_id)
    title 'Door'
    description 'very good door'
    cost '550 000 blr'
    material 'wood'
  end
end