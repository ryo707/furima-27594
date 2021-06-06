FactoryBot.define do
  factory :item do
    name                   {Faker::Name.initials}
    description             {Faker::Lorem.sentence}
    category_id             {2}
    condition_id            {3}
    shipping_charge_id      {2}
    prefecture_id           {3}
    delivery_day_id         {2}
    price                   {1000}  
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end

