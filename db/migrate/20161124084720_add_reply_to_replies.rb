class AddReplyToReplies < ActiveRecord::Migration
  def up
    add_column :replies, :parent, :integer
  end

  def down
    remove_column :replies, :parent
  end 
end
