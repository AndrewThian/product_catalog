FactoryGirl.define do
  sequence :sub_name do |n|
    "Test sub cat #{n}"
  end

  factory :sub_category do
    name { generate :sub_name }
    category
  end
end
