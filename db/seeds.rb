# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do |i|
  User.create(email: "user#{i+1}@example.com", password: "bs&E2wJC7A(?4X!", password_confirmation: "bs&E2wJC7A(?4X!")
end

User.all.each do |u|
  15.times do |i|
    u.todo_items.create(title: "To Do Item #{i+1} for #{u.email}", complete: i % 3  == 0 ? true : false  )
  end
end

User.all.each do |u|
  1.times do |i|
    u.articles.create(title: "Article #{i+1}", text: "This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.")
  end
end
