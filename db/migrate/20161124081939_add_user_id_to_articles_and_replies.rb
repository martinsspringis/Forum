class AddUserIdToArticlesAndReplies < ActiveRecord::Migration
  def up
    add_column :articles, :user_id, :integer
    add_column :replies, :user_id, :integer
  end

  def down
    remove_column :articles, :user_id
    remove_column :replies, :user_id
  end
end
