require 'spec_helper'

describe "adding deal to pipeline" do 
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:deal)  { FactoryGirl.create(:deal) }

  describe "when a user1 is not signed in" do 
    it "should redirect user to sign in page" do 
      visit market_path
      expect(page).to have_content("You need to sign in")
    end
  end

  describe "when user1 is signed in" do 
    before do 
      visit new_user_session_path
      fill_in "Username", with: user1.username 
      fill_in "Password", with: user1.password 
      click_button "SIGN IN" 
      visit market_path
    end

    it "should allow user1 to add deal to pipeline" do       
      click_link "Add to Pipeline"
      expect(page).to have_content("Deal has been added to your Pipeline.")  
      expect(AddToPipeline.count).to eq(1)
      expect(AddToPipeline.first.deal_id).to eq(deal.id)    
    end

    it "should allow user1 to remove deal from pipeline" do 
      click_link "Add to Pipeline"
      click_link "Remove from Pipeline"
      expect(page).to have_content("Deal has been removed from your Pipeline.")
      expect(AddToPipeline.count).to eq(0)
    end
  end
end