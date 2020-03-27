# frozen_string_literal: true

module ApplicationHelper
  def display_cart_items_count
    if current_user&.cart
      current_user.cart.line_items.count
    else
      if current_user
        cart = Cart.create(user_id: current_user.id)
        session[:cart_id] = cart.id
      else
        find_guest_cart
        @cart.line_items.count
      end
    end
    # current_user.cart&.line_items&.count
  end

  def find_guest_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def total_earning(orders)
    sum = 0
    orders.each do |order|
      sum += order.amount if order.status
    end
    sum
  end

  def get_status(status)
    if status
      'Approved'
    else
      'Pending'
    end
  end

  def get_other_status_value(status)
    if status
      0
    else
      1
    end
  end

  def get_other_status_text(status)
    if status
      'Pending'
    else
      'Approved'
    end
  end
end
