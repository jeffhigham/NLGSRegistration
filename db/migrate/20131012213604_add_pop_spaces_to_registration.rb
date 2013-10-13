class AddPopSpacesToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :pop_spaces, :integer
    add_column :registrations, :pop_display_type, :string
  end
end
