#require '/home/roberts/code/forums/app/services/troll_blocker'

class Reply < ActiveRecord::Base
  include MoralityChecker
  require 'troll_blocker'

  has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :article
  belongs_to :user

  #belongs_to :parent, class_name: "Reply"
  #has_many :children, class_name: "Reply", foreign_key: :parent_id, dependent: :destroy
  has_ancestry

  validates :author, presence: true
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
# Table name: replies
#
#  id                 :integer          not null, primary key
#  article_id         :integer
#  author             :string
#  content            :text
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  ancestry           :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
