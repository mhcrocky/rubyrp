FactoryBot.define do

  factory :note do
    body { "I am a note body had" }
    created_at { 1.hour.ago }
    user
    room
  end

end
