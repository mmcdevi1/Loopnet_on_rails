require 'spec_helper'

describe "deals/show" do
  before(:each) do
    @deal = assign(:deal, stub_model(Deal,
      :property_name => "Property Name",
      :user_id => 1,
      :property_address => "Property Address",
      :state => "State",
      :city => "City",
      :zipcode => "Zipcode"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Property Name/)
    rendered.should match(/1/)
    rendered.should match(/Property Address/)
    rendered.should match(/State/)
    rendered.should match(/City/)
    rendered.should match(/Zipcode/)
  end
end
