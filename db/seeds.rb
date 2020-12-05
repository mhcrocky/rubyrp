# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do |i|
  member = User.create(email: "member#{i+1}@example.com", password: "m@keTh1ng$", password_confirmation: "m@keTh1ng$")
  member.add_role 'member'
end

3.times do |i|
  admin = User.create(email: "admin#{i+1}@example.com", password: 'm@keTh1ng$', password_confirmation: "m@keTh1ng$")
  admin.add_role 'admin'
end

superadmin = User.create(email: 'superadmin@example.com', password: 'm@keTh1ng$', password_confirmation: "m@keTh1ng$")
superadmin.add_role 'superadmin'

sysadmin = User.create(email: 'sysadmin@example.com', password: 'm@keTh1ng$', password_confirmation: "m@keTh1ng$")
sysadmin.add_role 'sysadmin'

User.all.each do |u|
  5.times do |i|
    u.todo_items.create(title: "To Do Item #{i+1} for #{u.email}", complete: i % 3  == 0 ? true : false  )
  end
end

User.all.each do |u|
  3.times do |i|
    u.articles.create(title: "Article #{i+1}", text: "This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.")
  end
end
