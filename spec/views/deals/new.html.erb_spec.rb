require 'spec_helper'

describe "deals/new" do
  before(:each) do
    assign(:deal, stub_model(Deal,
      :property_name => "MyString",
      :user_id => 1,
      :property_address => "MyString",
      :state => "MyString",
      :city => "MyString",
      :zipcode => "MyString"
    ).as_new_record)
  end

  it "renders new deal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deals_path, "post" do
      assert_select "input#deal_property_name[name=?]", "deal[property_name]"
      assert_select "input#deal_user_id[name=?]", "deal[user_id]"
      assert_select "input#deal_property_address[name=?]", "deal[property_address]"
      assert_select "input#deal_state[name=?]", "deal[state]"
      assert_select "input#deal_city[name=?]", "deal[city]"
      assert_select "input#deal_zipcode[name=?]", "deal[zipcode]"
    end
  end
end
