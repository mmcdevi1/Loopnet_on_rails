require 'spec_helper'

describe "deals/index" do
  before(:each) do
    assign(:deals, [
      stub_model(Deal,
        :property_name => "Property Name",
        :user_id => 1,
        :property_address => "Property Address",
        :state => "State",
        :city => "City",
        :zipcode => "Zipcode"
      ),
      stub_model(Deal,
        :property_name => "Property Name",
        :user_id => 1,
        :property_address => "Property Address",
        :state => "State",
        :city => "City",
        :zipcode => "Zipcode"
      )
    ])
  end

  it "renders a list of deals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Property Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Property Address".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
  end
end
