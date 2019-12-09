# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts 'Cleaning database...'
User.destroy_all
Tag.destroy_all
Video.destroy_all
Translation.destroy_all
Line.destroy_all
Format.destroy_all
Icon.destroy_all

puts 'creating users'
User.create!(:email => 'bart.kuijper@example.com', :password => '123123')
User.create!(:email => 'thomas.velle@example.com', :password => '123123')

puts 'creating tags'

tags = ['Cardiovascular', '16:9', 'square']

tags.each do |tag|
  Tag.create!(:tag => tag)
end
