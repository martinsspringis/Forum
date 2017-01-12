class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name
    	t.attachment :icon
    	t.date :established
    end
  end
end
