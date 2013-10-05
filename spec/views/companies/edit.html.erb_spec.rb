require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :type => "",
      :name => "MyString",
      :division => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :country => "MyString",
      :phone => "MyString",
      :fax => "MyString",
      :email => "MyString",
      :website => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", company_path(@company), "post" do
      assert_select "input#company_type[name=?]", "company[type]"
      assert_select "input#company_name[name=?]", "company[name]"
      assert_select "input#company_division[name=?]", "company[division]"
      assert_select "input#company_address[name=?]", "company[address]"
      assert_select "input#company_city[name=?]", "company[city]"
      assert_select "input#company_state[name=?]", "company[state]"
      assert_select "input#company_zip[name=?]", "company[zip]"
      assert_select "input#company_country[name=?]", "company[country]"
      assert_select "input#company_phone[name=?]", "company[phone]"
      assert_select "input#company_fax[name=?]", "company[fax]"
      assert_select "input#company_email[name=?]", "company[email]"
      assert_select "input#company_website[name=?]", "company[website]"
      assert_select "textarea#company_description[name=?]", "company[description]"
    end
  end
end
