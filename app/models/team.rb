class Team < ActiveRecord::Base
	has_many :players
	has_many :games
	has_many :player_stats
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
