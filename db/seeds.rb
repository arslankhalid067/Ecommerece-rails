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

Category.create(name: 'Dell')
Category.create(name: 'HP')
Category.create(name: 'Lenovo')
Category.create(name: 'Gaming')
Category.create(name: 'Budget')

product = Product.new(name: 'Dell Laptop', description: 'Dell Laptop description', price: 450)
categories = Category.find_by_id(1)
product.categories = product.categories << categories
product.user_id = 1
product.save
product.image.attach(io: File.open('app/assets/images/dell.jpg'), filename: 'dell.jpg', content_type: 'image/jpg')

product = Product.new(name: 'Lenovo Gaming Laptop', description: 'Lenovo Gaming Laptop Description', price: 890)
categories = Category.where(id: [3, 4])
product.categories = product.categories << categories
product.user_id = 1
product.save
product.image.attach(io: File.open('app/assets/images/lenovo.jpeg'), filename: 'lenovo.jpeg', content_type: 'image/jpg')

product = Product.new(name: 'HP Budget Laptop', description: 'Hp Budget Laptop', price: 290)
categories = Category.where(id: [2, 5])
product.categories = product.categories << categories
product.user_id = 1
product.save
product.image.attach(io: File.open('app/assets/images/hp.jpg'), filename: 'hp.jpg', content_type: 'image/jpg')
