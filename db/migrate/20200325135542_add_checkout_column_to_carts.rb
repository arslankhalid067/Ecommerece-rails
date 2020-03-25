# frozen_string_literal: true

class AddCheckoutColumnToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :checkout, :boolean, default: false
  end
end
