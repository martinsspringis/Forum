class AddColumnsToReplyAndImage < ActiveRecord::Migration
  def up
    add_attachment :replies, :image
    add_column :images, :player_id, :integer
    add_column :images, :game_id, :integer
  end

  def down
  	remove_attachment :replies, :image
  	remove_column :images, :player_id
  	remove_column :images, :game_id
  end
end
