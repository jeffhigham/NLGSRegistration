class AddViaSponsorToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :via_sponsor, :boolean
  end
end
