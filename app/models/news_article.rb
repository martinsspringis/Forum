class NewsArticle < ActiveRecord::Base
	belongs_to :user
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
