FactoryBot.define do

  factory :note do
    body { "I am a note body had" }
    created_at { 2.days.ago }
    user
    room
  end

end
