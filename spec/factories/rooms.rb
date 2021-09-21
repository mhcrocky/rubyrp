FactoryBot.define do

  factory :room do
    name { "Room 101 too" }
    created_at { 1.hour.ago }
    updated_at { 1.hour.ago }
    user
  end

end
