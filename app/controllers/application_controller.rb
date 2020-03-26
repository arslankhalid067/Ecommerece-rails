# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
  before_action :get_categories

  def get_categories
    @categories = Category.all
  end
end
