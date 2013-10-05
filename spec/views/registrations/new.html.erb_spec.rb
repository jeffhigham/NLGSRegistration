require 'spec_helper'

describe "registrations/new" do
  before(:each) do
    assign(:registration, stub_model(Registration,
      :registration_id => "MyString",
      :payment_status => "MyString",
      :payment_type => "MyString"
    ).as_new_record)
  end

  it "renders new registration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", registrations_path, "post" do
      assert_select "input#registration_registration_id[name=?]", "registration[registration_id]"
      assert_select "input#registration_payment_status[name=?]", "registration[payment_status]"
      assert_select "input#registration_payment_type[name=?]", "registration[payment_type]"
    end
  end
end
