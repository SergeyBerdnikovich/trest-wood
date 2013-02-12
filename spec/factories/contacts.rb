FactoryGirl.define do
  factory :contact do
    content "<h1>Hello</h1><br><script>alert('bugaga')</script>"
  end
end