# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# conding: utf-8

 sale = Sale.create!(
  email: ENV["SALE_EMAIL"],
  password: ENV["SALE_PASSWORD"],
  password_confirmation: ENV["SALE_PASSWORD"]
)

profile = sale.build_profile({
  name: '未入力',
  birthplace: '未入力',
  hobby: '未入力',
  recent_event: '未入力',
  a_word: '未入力',
  phone_number: '未入力',
  # profile_image: File.open('./app/assets/images/no_image.jpg')

})
profile.save!