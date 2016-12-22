class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter]

  has_many :articles
  has_many :replies

  has_attached_file :asset, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :surname, presence: true
  validates :nickname, uniqueness: true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if nickname = conditions.delete(:nickname)
      where(conditions.to_h).where(["lower(nickname) = :value OR lower(email) = :value", { :value => nickname.downcase }]).first
    elsif conditions.has_key?(:nickname) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

#dealing with blocked users
  def account_active?
    !blocked
  end

  def active_for_authentication?
    super && account_active?
  end

  def inactive_message
    account_active? ? super : :locked
  end

  def full_name
    if name.present? or surname.present?
      "#{name} #{surname}"
    else
      email
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.first_name   # assuming the user model has a name
      user.surname = auth.info.last_name

      user.skip_confirmation!   #skipping confirmation via email if signing in via facebook
      user.save

      #user.asset = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  asset_file_name        :string
#  asset_content_type     :string
#  asset_file_size        :integer
#  asset_updated_at       :datetime
#  name                   :string
#  surname                :string
#  nickname               :string
#  warnings               :integer          default(0)
#  blocked                :boolean          default(FALSE)
#  admin                  :boolean          default(FALSE)
#  moderator              :boolean          default(FALSE)
#  provider               :string
#  uid                    :string
#
