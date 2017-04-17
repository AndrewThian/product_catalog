FactoryGirl.define do
  sequence :prod_name do |n|
    "Test sub sub cat #{n}"
  end

  sequence :price do |n|
    n*10.to_f
  end

  factory :product do
    name { generate :prod_name }
    description "Test description!!!"
    price { generate :price }
    thumb_img "http://placehold.it/200x200"
    sub_sub_category
  end

  factory :second_product, class: "Product" do
    name { generate :prod_name }
    description "Test description!!!"
    price { generate :price }
    thumb_img "http://placehold.it/200x200"
    sub_sub_category
  end
end
