class AddRegistrationIdToPopSpaces < ActiveRecord::Migration
  def change
    add_column :pop_spaces, :registration_id, :integer
  end
end
