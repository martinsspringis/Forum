class Reply < ActiveRecord::Base
  include MoralityChecker

  belongs_to :article
  belongs_to :user

  #belongs_to :parent, class_name: "Reply"
  #has_many :children, class_name: "Reply", foreign_key: :parent_id, dependent: :destroy
  has_ancestry

  validates :author, presence: true
  validates :content, presence: true

  before_save :check_morality
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
