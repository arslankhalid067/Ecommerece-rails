# frozen_string_literal: true

class OrdersController < ApplicationController
  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params['order']['status']
    @order.save
    redirect_to root_path
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to root_path
  end
end
