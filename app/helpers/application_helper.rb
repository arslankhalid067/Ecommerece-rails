# frozen_string_literal: true

module ApplicationHelper
  def display_cart_items_count
    if current_user&.cart
      current_user.cart.line_items.count
    else
      cart = Cart.find(session[:cart_id])
      cart.line_items.count
    end
    # current_user.cart&.line_items&.count
  end

  def total_earning(orders)
    sum = 0
    orders.each do |order|
      sum += order.amount
    end
    sum
  end
end
