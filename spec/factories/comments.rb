FactoryBot.define do

  factory :comment do
    body { "I am a comment body had" }
    user
    article
  end

end
