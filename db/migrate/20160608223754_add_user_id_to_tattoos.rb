class AddUserIdToTattoos < ActiveRecord::Migration
  def change
    add_column :tattoos, :user_id, :integer
  end
end
