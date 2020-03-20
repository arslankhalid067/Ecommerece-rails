# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :line_items
  has_many :carts, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  belongs_to :user
  has_one_attached :image

  validates :description, presence: true

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Item Present')
      throw :abort
    end
  end
end
