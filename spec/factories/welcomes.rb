FactoryGirl.define do
  factory :welcome do
    content "<h1>Hello</h1><br><script>alert('bugaga')</script>"
  end
end