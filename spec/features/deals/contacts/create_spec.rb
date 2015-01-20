require 'spec_helper'

describe "Adding contacts to a deal" do 
  let!(:user1)  { FactoryGirl.create(:user) }
  # let!(:user2)  { FactoryGirl.create(:user) }
  let!(:deal)   { FactoryGirl.create(:deal) }
  let!(:contact_from_user1) { FactoryGirl.create(:contact) }
  # let!(:contact_from_user2) { FactoryGirl.create(:contact) }
         
  def create_contact(options={})
    options[:contact_id] ||= 1

  end

  describe "when a user is not signed in" do 
    it "should redirect user to sign in page" do 
      visit deal_contacts_path(deal)
      expect(page).to have_content("You need to sign in")
    end
  end

  describe "when user is signed in" do 
    before do 
      visit new_user_session_path
      fill_in "Username", with: user1.username 
      fill_in "Password", with: user1.password 
      click_button "SIGN IN" 
      visit deal_contacts_path(deal)
    end

    # it "should not allow user1 to edit user2's deal contact" do 
    #   expect(page).to have_content("You can't do that")
    # end

    it "redirects back to the deal contacts page on successful submission on a new contact" do 
      expect(page).to have_content("Select")
      choose("contact_radio_1", contact_from_user1.id)
      click_button "Add"
      expect(ContactForDeal.count).to eq(1)
      expect(page).to have_content(contact_from_user1.company)
    end
  end
end













































