class CreateVideosTable < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.string :video_link
    	t.integer :video_type

    	t.timestamps
    end
  end
end
