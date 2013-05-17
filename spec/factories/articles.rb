FactoryGirl.define do
  factory :article do
    sequence(:title) {|n| "title-#{n}"}

    factory :published_article do
      body "published body"
      published true
    end

    factory :unpublished_article do
      body "unpublished body"
      published false
    end
  end
end
