class Player < ActiveRecord::Base
	belongs_to :team

	has_many :player_stats
end

# == Schema Information
#
# Table name: players
#
#  id                   :integer          not null, primary key
#  team_id              :integer
#  first_name           :string
#  last_name            :string
#  number               :integer
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  from                 :string
#  height               :decimal(2, 2)
#  weight               :decimal(2, 2)
#  born                 :date
#  nba_debut            :date
#  bio                  :text
#  created_at           :datetime
#  updated_at           :datetime
#
