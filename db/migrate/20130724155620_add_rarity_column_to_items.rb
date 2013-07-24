class AddRarityColumnToItems < ActiveRecord::Migration
  def change
    add_column :images, :rarity, :string
  end
end
