# frozen_string_literal: true

Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products
  resources :categories
  root 'products#index'
end
