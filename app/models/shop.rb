class Shop < ActiveRecord::Base

geocoded_by :address
# before_validation :geocode, if: :address_changed?
after_validation :geocode, if: :address_changed?
belongs_to :user

mount_uploader :picture_profile, Picture_profileUploader
mount_uploader :picture_banner, Picture_bannerUploader

validates :user_id, uniqueness: true
validates :name, presence: true
validates :address, presence: true
validates :picture_profile, presence: true

end
