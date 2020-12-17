FactoryBot.define do
  factory :origin do
    book_title            {"eee"}
    category_id           {2}
    youtube_url           {"uuu"}
    amazon                {"uuu"}
    text                  {"yyy"}
   
    association :user
    # after(:build) do |origin|
    #   item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
  end
end
