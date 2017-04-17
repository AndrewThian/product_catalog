FactoryGirl.define do
  sequence :sub_sub_name do |n|
    "Test sub sub cat #{n}"
  end

  factory :sub_sub_category do
    name { generate :sub_sub_name }
    sub_category
  end
end
