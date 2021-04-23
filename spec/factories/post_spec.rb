FactoryBot.define do
  factory :post do
    title          {"モンスター・ハンター"}
    supervision    {"ポール・W・S・アンダーソン"}
    country        {"アメリカ"}
    content        {"見応えがあって面白かった。"}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/640.jpg'))}
    association :user
  end
end
