class AddPrimaryPopDisplayTypeToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :primary_pop_display_type, :string
  end
end
