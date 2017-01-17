class AddSkinToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :skin_id, :integer
  end

  def down
  	remove_column :users, :skin_id
  end
end
