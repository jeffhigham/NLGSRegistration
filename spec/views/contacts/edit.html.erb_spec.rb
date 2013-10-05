require 'spec_helper'

describe "contacts/edit" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :company_id => 1,
      :primary_contact => false,
      :first_name => "MyString",
      :last_name => "MyString",
      :title => "MyString",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do
      assert_select "input#contact_company_id[name=?]", "contact[company_id]"
      assert_select "input#contact_primary_contact[name=?]", "contact[primary_contact]"
      assert_select "input#contact_first_name[name=?]", "contact[first_name]"
      assert_select "input#contact_last_name[name=?]", "contact[last_name]"
      assert_select "input#contact_title[name=?]", "contact[title]"
      assert_select "input#contact_phone[name=?]", "contact[phone]"
      assert_select "input#contact_email[name=?]", "contact[email]"
    end
  end
end
