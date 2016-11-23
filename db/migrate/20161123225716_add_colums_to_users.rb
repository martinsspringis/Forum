class AddColumsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :nickname, :string
  end

  def down
    remove_column :users, :name
    remove_column :users, :surname
    remove_column :users, :nickname
  end
end
