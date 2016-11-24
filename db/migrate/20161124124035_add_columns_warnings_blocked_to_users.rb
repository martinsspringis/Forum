class AddColumnsWarningsBlockedToUsers < ActiveRecord::Migration
  def up
    add_column :users, :warnings, :integer, default: 0
    add_column :users, :blocked, :boolean, default: false
  end

  def down
    remove_column :users, :warnings
    remove_column :users, :blocked
  end
end
