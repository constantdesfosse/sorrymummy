class AddPhotoToTattoo < ActiveRecord::Migration
  def change
    add_column :tattoos, :photo, :string
  end
end
