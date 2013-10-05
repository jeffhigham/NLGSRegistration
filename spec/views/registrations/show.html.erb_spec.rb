require 'spec_helper'

describe "registrations/show" do
  before(:each) do
    @registration = assign(:registration, stub_model(Registration,
      :registration_id => "Registration",
      :payment_status => "Payment Status",
      :payment_type => "Payment Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Registration/)
    rendered.should match(/Payment Status/)
    rendered.should match(/Payment Type/)
  end
end
