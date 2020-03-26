# frozen_string_literal: true

class AddStatusColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :string, default: 'Pending'
  end
end
