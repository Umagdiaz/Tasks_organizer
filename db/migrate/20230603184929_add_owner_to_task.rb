# frozen_string_literal: true

class AddOwnerToTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :owner, null: false, foreign_key: { to_table: :users }, index: true
  end
end
