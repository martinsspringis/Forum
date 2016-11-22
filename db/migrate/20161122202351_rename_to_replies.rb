class RenameToReplies < ActiveRecord::Migration
  def up
  	rename_table :answers, :replies
  end

  def down
  	rename_table :replies, :answers
  end
end
