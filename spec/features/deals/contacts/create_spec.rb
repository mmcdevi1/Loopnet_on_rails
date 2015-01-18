require 'spec_helper'

describe "Adding contacts to a deal" do 
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2)  { FactoryGirl.create(:user) }
  let!(:deal) { user1.deals.create(
                  property_name: "Avaya",
                  property_type: "Office",
                  property_class: "A") 
              }
  let!(:contact_from_user1) { user1.contacts.create(
                      full_name: "John Doe", 
                      phone_number: "1231231234", 
                      job_title: "VP", 
                      email: "jdoe@gmail.com",
                      company: "Apex Equities") 
                  }
  let!(:contact_from_user2) { user2.contacts.create(
                      full_name: "John Doe", 
                      phone_number: "1231231234", 
                      job_title: "VP", 
                      email: "jdoe@gmail.com",
                      company: "Apex Equities") 
                  }
  let!(:contact3) { FactoryGirl.create(:contact) }
  # let!(:contact_deal2) { user2. }                  
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
    end

    it "should not allow user1 to edit user2's deal contact" do 
      visit deal_contacts_path(deal)
      expect(page).to have_content("You can't do that")
    end

    it "redirects back to the contacts page on successful submission on a new contact" do 
      visit deal_contacts_path(deal)
      choose("contact_radio_1", contact_from_user1.id)
      click_button "Submit"
      expect(ContactForDeal.count).to eq(1)
      expect(page).to have_content(contact_from_user1.company)
    end
  end
end