FactoryBot.define do

  factory :article do
    title { "The quick brown fox is and are jumping over the lazy dog about porque." }
    created_at { 1.hour.ago }
    updated_at { 1.hour.ago }
    user
  end

end
