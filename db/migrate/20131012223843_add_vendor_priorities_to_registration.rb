class AddVendorPrioritiesToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :lg_priorities, :string
    add_column :registrations, :pet_priorities, :string
  end
end
