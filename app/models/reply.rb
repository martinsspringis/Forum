class Reply < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  has_many :children
  belongs_to :parent

  validates :author, presence: true
  validates :body, presence: true
end

# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  article_id :integer
#  author     :string
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  parent     :integer
#
