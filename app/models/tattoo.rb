class Tattoo < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true

  mount_uploader :photo, PhotoUploader

end
