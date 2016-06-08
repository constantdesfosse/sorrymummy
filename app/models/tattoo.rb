class Tattoo < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true
  validates :photo, presence: true

end
