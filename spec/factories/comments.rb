FactoryBot.define do

  factory :comment do
    body { "I am a comment body" }
    user
    article
  end

end
