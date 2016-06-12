class AddBanneruserToUser < ActiveRecord::Migration
  def change
    add_column :users, :banneruser, :string
  end
end
