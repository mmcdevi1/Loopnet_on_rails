require 'spec_helper' 

describe "Deleting contact items" do 
   let!(:user1)  { FactoryGirl.create(:user) }
   let!(:contact_from_user1) { user1.contacts.create(
                      full_name: "John Doe", 
                      phone_number: "1231231234", 
                      job_title: "VP", 
                      email: "jdoe@gmail.com",
                      company: "Apex") 
                  }

  before do 
    visit new_user_session_path
    fill_in "Username", with: user1.username 
    fill_in "Password", with: user1.password 
    click_button "SIGN IN" 
  end

  it "is successfully deletes an item" do 
    visit contacts_path

    within "#contact_#{contact_from_user1.id}" do 
      click_link "Delete"
    end

    expect(page).to_not have_content(contact_from_user1.full_name)
    expect(Contact.count).to eq(0)
    expect(page).to have_content("Contact deleted.")
  end
end 