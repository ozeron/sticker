FactoryGirl.define do
  sequence :id do |n|
    n
  end
end

FactoryGirl.define do
  factory :vk_wall_post, class: VK::WallPost do
    id { generate(:id) }
    owner_id { generate(:id) }
    from_id { generate(:id) }
    date { Faker::Date.between(2.days.ago, Date.today) }
    text { Faker::Lorem.paragraph(4) }
  end
end
