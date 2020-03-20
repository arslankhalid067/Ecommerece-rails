# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @products = Product.all
    @count= Cart.all.count
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  protected

  def product_params
    params.require(:product).permit(:name, :description, :image, :price)
  end
end
