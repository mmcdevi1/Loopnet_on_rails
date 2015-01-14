require 'spec_helper'

describe "Creating contacts" do 
  let!(:user)  { FactoryGirl.create(:user) }

  def create_contact(options={})
    options[:full_name] ||= "Dale Jr"
    options[:email] ||= "m@gmail.com"
    options[:phone_number] ||= "9149805339"
    options[:job_title] ||= "prez"

    visit contacts_path
    click_link "New Contact"
    expect(page).to have_content("Contacts")
    fill_in "Full Name", with: options[:full_name]
    fill_in "Email", with: options[:email]
    fill_in "Phone number", with: options[:phone_number]
    fill_in "Job title", with: options[:job_title]
    click_button "Save"
  end

  describe "when user is not signed in" do 
    # test whether devise's autheticate is successful if user is not signed in
    it "should redirect user to sign in page" do 
      visit new_contact_path
      expect(page).to have_content("You need to sign in")
    end
  end

  describe "when user is signed in" do 
    before do 
      visit new_user_session_path
      fill_in "Username", with: user.username 
      fill_in "Password", with: user.password 
      click_button "SIGN IN" 
    end

    it "redirects to the contacts index page on successful submission of a new contact" do 
      create_contact
      
      expect(page).to have_content("Contact created") # testing flash message
      expect(Contact.count).to eq(1) # testing if contact count is 1 in database

      # testing within class table will ensure the redirect is successful after submission
      within(".table > tbody > tr > td") do 
        expect(page).to have_content("Dale Jr")
      end
    end

    it "displays an error when the full_name field is empty" do 
      create_contact full_name: ""
      expect(page).to have_content("error")
    end

    it "displays an error when the email field is empty" do 
      create_contact email: ""
      expect(page).to have_content("error")
    end

    it "displays an error when the phone_number field is empty" do 
      create_contact phone_number: ""
      expect(page).to have_content("error")
    end

    it "displays an error when the job_title field is empty" do 
      create_contact job_title: ""
      expect(page).to have_content("error")
    end
  end
end

















































