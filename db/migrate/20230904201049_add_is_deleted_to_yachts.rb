class AddIsDeletedToYachts < ActiveRecord::Migration[7.0]
  def change
    add_column :yachts, :is_deleted, :boolean
  end
end
