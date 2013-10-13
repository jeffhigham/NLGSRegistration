class AddProtoSpacesToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :proto_spaces, :integer
    add_column :registrations, :proto_display_type, :string
  end
end
