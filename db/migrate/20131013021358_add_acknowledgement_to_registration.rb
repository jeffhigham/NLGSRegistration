class AddAcknowledgementToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :acknowledgement, :boolean, default: false
    add_column :registrations, :vendor_loyalty_discount, :boolean, default: false
    add_column :registrations, :pay_in_full, :boolean, default: true
    add_column :registrations, :payment_method, :string, default: 'credit_card'
  end
end
