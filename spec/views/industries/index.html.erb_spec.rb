require 'spec_helper'

describe "industries/index" do
  before(:each) do
    assign(:industries, [
      stub_model(Industry,
        :company_id => 1,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Industry,
        :company_id => 1,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of industries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
