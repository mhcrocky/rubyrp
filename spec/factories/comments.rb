FactoryBot.define do

  factory :comment do
    body { "I am a comment body, así que tengo dueño." }
    user
    article
  end

end
