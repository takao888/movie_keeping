FactoryBot.define do
  factory :comment do
    comment {"本作品は私も好きで..."}
    association :user
    association :post
  end
end
