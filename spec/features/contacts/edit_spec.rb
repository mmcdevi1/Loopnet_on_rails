require 'spec_helper'

describe "Editing contact items" do 
  let!(:user1)  { FactoryGirl.create(:user) }
  let!(:user2)  { FactoryGirl.create(:user) }
  let!(:contact_from_user1) { FactoryGirl.create(:contact) }  
  let!(:contact_from_user2) { FactoryGirl.create(:contact) }   

  def update_contact(options={})
    options[:full_name] ||= "Dale Jr"
    options[:email] ||= "m@gmail.com"
    options[:phone_number] ||= "9149805339"
    options[:job_title] ||= "prez"
    options[:company] ||= "Apex"

    contact = options[:contact_from_user1]

    visit edit_contact_path(contact_from_user1)
    expect(page).to have_content(contact_from_user1.full_name)
    fill_in "Full Name", with: options[:full_name]
    fill_in "Email", with: options[:email]
    fill_in "Phone number", with: options[:phone_number]
    fill_in "Job title", with: options[:job_title]
    fill_in "Company", with: options[:company]
    click_button "Save"
  end

  describe "when user is not signed in" do 
    # test whether devise's autheticate is successful if user is not signed in
    it "should redirect user to sign in page" do 
      visit edit_contact_path(contact_from_user1)
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

    it "should not allow user1 to edit user2's contact" do 
      visit edit_contact_path(contact_from_user2)
      expect(page).to have_content("You can't do that")
    end

    describe "valid attributes" do 
      it "should update contact successfully" do 
        update_contact contact: contact_from_user1, full_name: "John Doe"
        contact_from_user1.reload
        expect(page).to have_content("Contact updated.")
        expect(contact_from_user1.full_name).to eq("John Doe")
      end

      it "displays an error when full_name is empty" do 
        update_contact contact: contact_from_user1, full_name: ""
        expect(page).to have_content("error")
      end

      it "displays an error when phone_number is empty" do 
        update_contact contact: contact_from_user1, phone_number: ""
        expect(page).to have_content("error")
      end

      it "displays an error when email is empty" do 
        update_contact contact: contact_from_user1, email: ""
        expect(page).to have_content("error")
      end

      it "displays an error when job_title is empty" do 
        update_contact contact: contact_from_user1, job_title: ""
        expect(page).to have_content("error")
      end

      it "displays an error when company is empty" do 
        update_contact contact: contact_from_user1, company: ""
        expect(page).to have_content("error")
      end
    end
  end
end









































