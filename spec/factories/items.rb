FactoryBot.define do
  factory :item do
    name                  {"test"}
    description           {"test"}
    category_id           {2}
    condition_id          {2}
    ship_id               {2}
    prefecture_id         {2}
    day_id                {2}
    price                 {2000}
    association           :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_0648.JPG'), filename: 'IMG_0648.JPG')
    end
  end
end