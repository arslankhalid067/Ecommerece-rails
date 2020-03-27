# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :get_categories
  before_action :authenticate_user!, except: %i[show index]
  before_action :admin?, except: %i[show index]
  def index
    @products = Product.all.order(:id)
    @orders = Order.all.order(:id)
    @categories = Category.all.order(:id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @categories = Category.where(id: params[:product][:categories])
    @product.categories = @categories
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
    @categories = Category.where(id: params[:product][:categories])
    @product.categories = @categories
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

  def admin?
    unless current_user.admin
      redirect_to products_path,
                  notice: 'Sorry You are not authorized to perform this action.'
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :image, :price, :categories)
  end

  def get_categories
    @categories = Category.all
  end
end
