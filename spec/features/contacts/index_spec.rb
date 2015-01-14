require 'spec_helper' 

describe "Viewing contact items" do 
  let!(:user1)  { FactoryGirl.create(:user) }
  let!(:user2)  { FactoryGirl.create(:user) }
  let!(:contact_from_user1) { user1.contacts.create(
                      full_name: "John Doe", 
                      phone_number: "1231231234", 
                      job_title: "VP", 
                      email: "jdoe@gmail.com",
                      company: "Apex Equities") 
                  }
  let!(:contact_from_user2) { user2.contacts.create(
                      full_name: "Kevin McCallister", 
                      phone_number: "9879879887", 
                      job_title: "President", 
                      email: "kmc@gmail.com",
                      company: "Apex Equities") 
                  }

  describe "when user is not signed in" do 
    # test whether devise's autheticate is successful if user is not signed in
    it "should redirect user to sign in page" do 
      visit contacts_path
      expect(page).to have_content("You need to sign in")
    end
  end

  describe "when user1 is signed in" do 
    before do 
      visit new_user_session_path
      fill_in "Username", with: user1.username 
      fill_in "Password", with: user1.password 
      click_button "SIGN IN" 
    end

    it "displays the contact information for the current user" do 
      # test whether the current_user can view only his/her contacts
      visit contacts_path
      within(".table > tbody > tr#contact_#{contact_from_user1.id}") do 
        expect(page).to have_content(contact_from_user1.full_name)
      end
    end
  end
end