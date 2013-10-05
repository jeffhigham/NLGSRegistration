require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :type => "Type",
      :name => "Name",
      :division => "Division",
      :address => "Address",
      :city => "City",
      :state => "State",
      :zip => "Zip",
      :country => "Country",
      :phone => "Phone",
      :fax => "Fax",
      :email => "Email",
      :website => "Website",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    rendered.should match(/Name/)
    rendered.should match(/Division/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zip/)
    rendered.should match(/Country/)
    rendered.should match(/Phone/)
    rendered.should match(/Fax/)
    rendered.should match(/Email/)
    rendered.should match(/Website/)
    rendered.should match(/MyText/)
  end
end
