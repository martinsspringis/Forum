class Reply < ActiveRecord::Base
  include MoralityChecker

  belongs_to :article
  belongs_to :user

  has_many :children
  belongs_to :parent

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
#  parent     :integer
#
