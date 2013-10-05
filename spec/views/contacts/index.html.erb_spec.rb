require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :company_id => 1,
        :primary_contact => false,
        :first_name => "First Name",
        :last_name => "Last Name",
        :title => "Title",
        :phone => "Phone",
        :email => "Email"
      ),
      stub_model(Contact,
        :company_id => 1,
        :primary_contact => false,
        :first_name => "First Name",
        :last_name => "Last Name",
        :title => "Title",
        :phone => "Phone",
        :email => "Email"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
