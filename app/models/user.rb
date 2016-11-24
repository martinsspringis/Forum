class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :asset, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

  #validates :nickname, presence: true, uniqueness: true
  #validates :name, presence: true
  #validates :surname, presence: true
end
