class User < ActiveRecord::Base

  geocoded_by :address
  # before_validation :geocode, if: :address_changed?
  after_validation :geocode, if: :address_changed?

  mount_uploader :photo, PhotoUploader
  mount_uploader :banneruser, BanneruserUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

    has_many :tattoos, dependent: :destroy
    has_one :shop, dependent: :destroy

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def choosephoto
    if picture
      picture
    else
      photo
    end
  end

  def initials
    "#{self.first_name.first}#{self.last_name.first}"
  end

end
