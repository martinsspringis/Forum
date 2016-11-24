class ChangeColumnNameToContent < ActiveRecord::Migration
  def up
    rename_column :articles, :article, :content
    rename_column :replies, :body, :content
  end

  def down 
    rename_column :articles, :content, :article
    rename_column :replies, :content, :body  	
  end
end
