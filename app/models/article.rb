class Article < ActiveRecord::Base
  has_many :answers, dependent: :destroy

  validates :author, presence: true
  validates :title, presence: true
  validates :article, presence: true
end