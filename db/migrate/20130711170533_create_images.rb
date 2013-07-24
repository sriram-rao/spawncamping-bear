class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :item_id
      t.string :url

      t.timestamps
    end
  end
end
