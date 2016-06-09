class RemovePhotoFromTattoo < ActiveRecord::Migration
  def change
    remove_column :tattoos, :photo, :string
  end
end
