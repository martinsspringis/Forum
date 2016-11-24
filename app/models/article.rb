class Article < ActiveRecord::Base
  has_many :replies, dependent: :destroy

  belongs_to :user

  validates :author, presence: true
  validates :title, presence: true
  validates :article, presence: true
end

# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  author     :string
#  title      :string
#  article    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#
