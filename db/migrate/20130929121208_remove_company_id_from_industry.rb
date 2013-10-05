class RemoveCompanyIdFromIndustry < ActiveRecord::Migration
  def change
    remove_column :industries, :company_id
  end
end
