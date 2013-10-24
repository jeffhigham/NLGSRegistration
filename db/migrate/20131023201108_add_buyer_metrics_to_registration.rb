class AddBuyerMetricsToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :buyer_num_stores, :integer
    add_column :registrations, :buyer_areas_served, :string
    add_column :registrations, :buyer_avg_sqft, :integer
    add_column :registrations, :buyer_annual_lg_volume, :string
  end
end
