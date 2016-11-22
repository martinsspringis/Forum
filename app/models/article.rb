class Article < ActiveRecord::Base
  has_many :replies, dependent: :destroy

  validates :author, presence: true
  validates :title, presence: true
  validates :article, presence: true
end