class Player < ActiveRecord::Base
	belongs_to :team

	has_many :player_stats

	has_attached_file :picture, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  def full_name
    if first_name.present? or last_name.present?
    	"#{first_name} #{last_name}"
    end
  end

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
