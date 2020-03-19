# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  belongs_to :user
  has_one_attached :image

  validates :description, presence: true
end
