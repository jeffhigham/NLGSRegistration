class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :type
      t.string :name
      t.string :division
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :fax
      t.string :email
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
