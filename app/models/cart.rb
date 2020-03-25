# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_one :order
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_product = line_items.find_by(product_id: product.id)
    if current_product
      current_product.increment(:quantity)
    else
      current_product = line_items.build(product_id: product.id)
    end
    current_product
  end

  def total_price
    sum = 0
    line_items.each do |product|
      sum += product.product.price * product.quantity
    end
    sum
  end

  def total_price_in_cents
    sum = 0
    line_items.each do |product|
      sum += product.product.price * product.quantity
    end
    sum * 100
  end

  def checkout_cart
    order = Order.new
    order.user_id = user.id
    order.cart_id = id
    order.amount = total_price
    order.save
    self.checkout = true
    self.user_id = nil
    save
  end
end
