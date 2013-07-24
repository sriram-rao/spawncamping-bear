class AddColumnToImages < ActiveRecord::Migration
  def change
  	add_column :images, :item_name, :string
  	add_index :images, :item_id
  	add_index :images, :item_name
  end
end
