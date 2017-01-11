class AddRoleRemoveAdminModerator < ActiveRecord::Migration
  def up
  	add_column :users, :role, :integer, default: 1
  	remove_column :users, :admin 
  	remove_column :users, :moderator 
  end

  def down
  	remove_column :users, :role
  	add_column :users, :admin, :boolean, default: false
  	add_column :users, :moderator, :boolean, default: false
  end
end
