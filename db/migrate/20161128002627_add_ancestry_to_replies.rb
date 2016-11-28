class AddAncestryToReplies < ActiveRecord::Migration
  def up
  	add_column :replies, :ancestry, :string
  	add_index :replies, :ancestry
  end

  def down
  	remove_index :replies, :ancestry
  	remove_column :replies, :ancestry
  end
end
