class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.attachment :image
    	t.integer :article_id

    	t.timestamps
    end
  end
end
