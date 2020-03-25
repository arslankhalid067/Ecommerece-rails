# frozen_string_literal: true

module ApplicationHelper
  def display_cart_items_count
    current_user.cart&.line_items&.count
  end
end
