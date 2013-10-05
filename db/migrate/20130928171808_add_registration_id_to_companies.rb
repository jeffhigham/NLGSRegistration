class AddRegistrationIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :registration_id, :integer
  end
end
