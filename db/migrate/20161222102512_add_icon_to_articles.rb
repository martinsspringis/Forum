class AddIconToArticles < ActiveRecord::Migration
  def up
  	add_attachment :articles, :icon
  end

  def down
  	remove_attachment :articles, :icon
  end
end
