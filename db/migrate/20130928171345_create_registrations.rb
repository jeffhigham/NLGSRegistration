class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :registration_id
      t.string :payment_status
      t.string :payment_type

      t.timestamps
    end
  end
end
