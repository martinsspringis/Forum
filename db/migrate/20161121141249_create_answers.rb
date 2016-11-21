class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.integer :article_id
    	t.string :author
    	t.text :body

    	t.timestamps
    end
  end
end
