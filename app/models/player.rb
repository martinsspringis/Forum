class Player < ActiveRecord::Base
	belongs_to :team

	has_many :player_stats
  has_many :images

	has_attached_file :picture, styles: { large: "600x600", medium: "300x300", thumb: "50x50"}
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :team_id, presence: true

  def name
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
#  born                 :date
#  nba_debut            :date
#  bio                  :text
#  created_at           :datetime
#  updated_at           :datetime
#  height               :integer
#  weight               :integer
#  position             :string(2)
#
