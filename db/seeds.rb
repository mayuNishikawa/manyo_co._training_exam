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

Label.create!(name: "開発")
Label.create!(name: "運用")
Label.create!(name: "検討課題")
Label.create!(name: "ミーティング")