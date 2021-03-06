class Image < ActiveRecord::Base
	belongs_to :player
	belongs_to :game

	has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end

# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  article_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#  player_id          :integer
#  game_id            :integer
#
