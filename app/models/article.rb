class Article < ActiveRecord::Base
  include MoralityChecker

  has_many :replies, dependent: :destroy

  belongs_to :user

  validates :author, presence: true
  validates :title, presence: true
  validates :content, presence: true

  before_save :check_morality

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
