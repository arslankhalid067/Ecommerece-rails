# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@devshop.com', password: '123456', password_confirmation: '123456', admin: true)
User.create(email: 'arslan@devshop.com', password: '123456', password_confirmation: '123456')

Product.create(name: 'Product 1', description: 'Description of Product 1', price: 1500, user_id: 1)
Product.create(name: 'Product 2', description: 'Description of Product 2', price: 1500, user_id: 1)
