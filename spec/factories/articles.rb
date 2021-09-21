FactoryBot.define do

  factory :article do
    title { "I am a title had" }
    created_at { 1.hour.ago }
    updated_at { 1.hour.ago }
    user
  end

end
