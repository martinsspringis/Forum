class Team < ActiveRecord::Base
	has_many :players
	has_many :games
	has_many :player_stats

	has_attached_file :icon, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true
end

# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  name              :string
#  icon_file_name    :string
#  icon_content_type :string
#  icon_file_size    :integer
#  icon_updated_at   :datetime
#  established       :date
#
