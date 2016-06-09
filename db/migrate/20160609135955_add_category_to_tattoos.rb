class AddCategoryToTattoos < ActiveRecord::Migration
  def change
    add_column :tattoos, :category, :string
  end
end
