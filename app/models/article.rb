class Article < ActiveRecord::Base
  has_many :answers

  validates :author, presence: true
  validates :title, presence: true
  validates :article, presence: true
end