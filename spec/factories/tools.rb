FactoryGirl.define do
  factory :tool do
    image_path  Faker::Avatar.image
    name        Faker::Commerce.product_name
    description Faker::Lorem.paragraph(2)
    price       Faker::Commerce.price
    inventory   Faker::Number.number(3)
  end
end
