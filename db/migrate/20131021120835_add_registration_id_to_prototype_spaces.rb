class AddRegistrationIdToPrototypeSpaces < ActiveRecord::Migration
  def change
    add_column :prototype_spaces, :registration_id, :integer
  end
end
