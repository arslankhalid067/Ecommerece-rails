# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin/products', to: 'admins#products', as: 'admin_products'
  get 'admin/categories', to: 'admins#categories', as: 'admin_categories'
  get 'admin/orders', to: 'admins#orders', as: 'admin_orders'
  resources :orders

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  resources :line_items
  resources :carts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products
  resources :categories
  root 'products#index'
end
