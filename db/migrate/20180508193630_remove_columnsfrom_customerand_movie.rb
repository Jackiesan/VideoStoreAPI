class RemoveColumnsfromCustomerandMovie < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :available_inventory, :integer
    remove_column :customers, :movies_checked_out_count, :integer
  end
end
