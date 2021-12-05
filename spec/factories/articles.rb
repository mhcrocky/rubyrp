FactoryBot.define do

  factory :article do
    title { "The QUICK brown fOx is AND are jumping OVER THE lazy dog about porque." }
    created_at { 1.hour.ago }
    updated_at { 1.hour.ago }
    user
  end

end
