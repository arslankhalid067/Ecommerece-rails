# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user, optional: true
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
end
