require 'spec_helper'

describe "registrations/index" do
  before(:each) do
    assign(:registrations, [
      stub_model(Registration,
        :registration_id => "Registration",
        :payment_status => "Payment Status",
        :payment_type => "Payment Type"
      ),
      stub_model(Registration,
        :registration_id => "Registration",
        :payment_status => "Payment Status",
        :payment_type => "Payment Type"
      )
    ])
  end

  it "renders a list of registrations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Registration".to_s, :count => 2
    assert_select "tr>td", :text => "Payment Status".to_s, :count => 2
    assert_select "tr>td", :text => "Payment Type".to_s, :count => 2
  end
end
