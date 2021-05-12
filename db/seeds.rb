# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Contributor.destroy_all
Repository.destroy_all

puts 'Creating repositories...'
repository = Repository.create!(
  name: 'React',
  version: '17.0.2',
  description: 'React is a JavaScript library for building user interfaces.url',
  url: 'https://www.npmjs.com/package/react',
  publisher: 'gaearon'
)

puts 'Creating contributors...'
Contributor.create!(name: 'fb', repository: repository)

puts 'All done'
