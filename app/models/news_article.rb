class NewsArticle < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end

# == Schema Information
#
# Table name: news_articles
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  title              :string
#  article            :text
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#
