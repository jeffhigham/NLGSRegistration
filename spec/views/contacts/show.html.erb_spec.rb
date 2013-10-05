require 'spec_helper'

describe "contacts/show" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :company_id => 1,
      :primary_contact => false,
      :first_name => "First Name",
      :last_name => "Last Name",
      :title => "Title",
      :phone => "Phone",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Title/)
    rendered.should match(/Phone/)
    rendered.should match(/Email/)
  end
end
