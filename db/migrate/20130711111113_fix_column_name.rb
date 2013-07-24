class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :mane, :name
  end
end
