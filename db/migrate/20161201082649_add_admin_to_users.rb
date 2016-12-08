class AddAdminToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :admin, :boolean, default: false
  	add_column :users, :moderator, :boolean, default: false
  end

  def down
  	remove_column :users, :admin
  	remove_column :users, :moderator
  end
end
