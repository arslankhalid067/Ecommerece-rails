# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, only: %i[index show]
  resources :categories, only: %i[show]
  root 'products#index'
end
