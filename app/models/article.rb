class Article < ActiveRecord::Base
  include MoralityChecker
  require 'troll_blocker'

  has_attached_file :icon, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/


  has_many :replies, dependent: :destroy
  has_many :images

  belongs_to :user

  validates :author, presence: true
  validates :title, presence: true
  validates :content, presence: true

  before_save :check_morality
  after_save :troll_block

  def troll_block
  	if user_id  	  
  		troll_blocker = TrollBlocker.new(user)
  	  troll_blocker.check_and_proceed
    end    
  end

end

# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  author     :string
#  title      :string
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#
