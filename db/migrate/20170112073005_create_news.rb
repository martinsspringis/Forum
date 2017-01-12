class CreateNews < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|
    	t.integer :user_id
    	t.string :title
    	t.text :article
    	t.attachment :image

    	t.timestamps
    end
  end
end
