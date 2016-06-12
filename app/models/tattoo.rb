class Tattoo < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tags

  belongs_to :user

  validates :name, presence: true
  validates :tag_list, presence: true
  validates :category, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

end
