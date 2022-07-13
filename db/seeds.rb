# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "mayu nishikawa",
  email: "admin.mayu@example.com",
  password: "nisinisi",
  admin: true
)

9.times do |n|
  User.create!(
    name: "user#{n + 1}",
    email: "test#{n + 1}@test.com",
    password: "testtest#{n + 1}",
    admin: false
  )
end

User.all.each do |user|
  3.times do |n|
    user.tasks.create!(
      name: "sample#{n + 1}",
      content: "sample task",
      deadline: "002022-07-08-00-00",
      status: 'not_yet',
      priority: 'high'
    )
  end
  3.times do |n|
    user.tasks.create!(
      name: "sample#{n + 1}",
      content: "sample task",
      deadline: "002022-07-07-00-00",
      status: 'doing',
      priority: 'medium'
    )
  end
  4.times do |n|
    user.tasks.create!(
      name: "sample#{n + 1}",
      content: "sample task",
      deadline: "002022-07-06-00-00",
      status: 'done',
      priority: 'low'
    )
  end
end

Label.create!(name: "開発")
Label.create!(name: "運用")
Label.create!(name: "検討課題")
Label.create!(name: "ミーティング")
Label.create!(name: "勉強会")
Label.create!(name: "ruby")
Label.create!(name: "rails")
Label.create!(name: "報告")
Label.create!(name: "連絡")
Label.create!(name: "相談")
