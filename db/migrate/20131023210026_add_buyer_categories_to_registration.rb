class AddBuyerCategoriesToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :lg_categories, :string
    add_column :registrations, :pet_categories, :string
  end
end
