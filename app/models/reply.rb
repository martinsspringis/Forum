#require '/home/roberts/code/forums/app/services/troll_blocker'

class Reply < ActiveRecord::Base
  include MoralityChecker
  require '/home/roberts/code/forums/app/services/troll_blocker'

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
#  id         :integer          not null, primary key
#  article_id :integer
#  author     :string
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  ancestry   :string
#
