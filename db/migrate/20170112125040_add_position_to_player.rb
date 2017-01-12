class AddPositionToPlayer < ActiveRecord::Migration
  def up
  	add_column :players, :position, :string, limit: 2
  end

  def down
  	remove_column :players, :position
  end
end
