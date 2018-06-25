# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create name: 'Loris', status: :active, kind: :manager, email: 'loris@loris.com', password: 123456
User.create name: 'Loris2', status: :active, kind: :helper, email: 'loris2@loris.com', password: 123456
