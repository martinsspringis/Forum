class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.integer :team_id
    	t.string :first_name
    	t.string :last_name
    	t.integer :number
    	t.attachment :picture
    	t.string :from
    	t.decimal :height, precision: 2, scale: 2
    	t.decimal :weight, precision: 2, scale: 2
    	t.date :born
    	t.date :nba_debut
    	t.text :bio						#player biography

    	t.timestamps
    end
  end
end
