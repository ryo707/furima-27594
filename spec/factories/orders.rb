FactoryBot.define do
  factory :order do
    token {'111111'}
    postal_code     {'123-4567'}
    prefecture_id   {2}
    city            {'大阪府'}
    street          {'3-22'}
    building        {'大阪ビル'}
    phone           {'09034567890'}
    association :user
    association :item
  end
end
