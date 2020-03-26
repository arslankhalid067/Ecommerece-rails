# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :get_categories
  def show
    @category = Category.find(params[:id])
    @products = @category.products.all
    @orders = Order.all
  end

  def get_categories
    @categories = Category.all
  end
end
