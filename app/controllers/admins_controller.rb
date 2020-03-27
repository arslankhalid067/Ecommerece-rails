# frozen_string_literal: true

class AdminsController < ApplicationController
  def products
    @products = Product.all.order(:id)
  end

  def categories
    @categories = Category.all.order(:id)
  end

  def orders
    @orders = Order.all.order(:id)
  end
end
