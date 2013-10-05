class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :company_id
      t.boolean :primary_contact
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
