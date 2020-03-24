# frozen_string_literal: true

class AddUserIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :user, foreign_key: true, null: true
  end
end
