require 'spec_helper'

describe "loggin in" do 
  let(:user) { FactoryGirl.create(:user) }

  it "successfully logs the user in" do 
    visit root_path
    click_link "Login"
    fill_in "Username", with: user.username 
    fill_in "Password", with: user.password 
    click_button "SIGN IN"
    expect(page).to have_content("Signed in successfully")
  end  
end