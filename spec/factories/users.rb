FactoryBot.define do
  factory :user do
    sequence(:email) { "testuser@example.com" }
    password { "password" }

    factory :user_with_todo_items do
      transient do
        todo_items_count { 5 }
      end
      after(:create) do |user, evaluator|
        create_list(:todo_item, evaluator.todo_items_count, user: user)
      end
    end

    factory :user_with_completed_todo_items do
      transient do
        todo_items_count { 5 }
      end
      after(:create) do |user, evaluator|
        create_list(:completed_todo_item, evaluator.todo_items_count, user: user)
      end
    end

    factory :member do
      after(:create) {|user| user.add_role(:member)}
    end

    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end

    factory :superadmin do
      after(:create) {|user| user.add_role(:superadmin)}
    end

    factory :sysadmin do
      after(:create) {|user| user.add_role(:sysadmin)}
    end

  end
end
