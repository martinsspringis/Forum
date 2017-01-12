class ChangePlayerTable < ActiveRecord::Migration
  
  def up
    remove_column :players, :height
    remove_column :players, :weight
    add_column :players, :height, :integer
    add_column :players, :weight, :integer
  end

  def down
  	remove_column :players, :height
  	remove_column :players, :weight
  	add_column :players, :height, :decimal
  	add_column :players, :weight, :decimal
  end
end
