# frozen_string_literal: true

class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.all
    @orders = Order.all
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
