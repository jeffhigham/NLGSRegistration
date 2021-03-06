require 'spec_helper'

describe "industries/new" do
  before(:each) do
    assign(:industry, stub_model(Industry,
      :company_id => 1,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new industry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", industries_path, "post" do
      assert_select "input#industry_company_id[name=?]", "industry[company_id]"
      assert_select "input#industry_name[name=?]", "industry[name]"
      assert_select "textarea#industry_description[name=?]", "industry[description]"
    end
  end
end
