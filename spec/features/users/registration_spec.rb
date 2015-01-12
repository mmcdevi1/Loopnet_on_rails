require 'spec_helper'

describe "registering new users" do 
  before do 
    visit root_path
    click_link "Register"  
  end

  it "successfully creates a new user in the database" do     
    expect(page).to have_selector('h3', text: "Create your Pipeline Account") 
    fill_in "First Name", with: "Michael"
    fill_in "Last Name", with: "McDevitt"
    fill_in "Username", with: "mmcdevi1"
    fill_in "Email Address", with: "mmcdevi1@gmail.com"
    fill_in "Password", with: "koplop"
    fill_in "Confirm Password", with: "koplop"
    click_button "REGISTER"
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  describe "errors" do 
    it "displays an error when the first name field is empty" do     
      click_button "REGISTER"
      expect(page).to have_content("Firstname can't be blank")
    end

    it "displays an error when the last name field is empty" do 
      click_button "REGISTER" 
      expect(page).to have_content("Lastname can't be blank")
    end

    it "displays an error when the username field is empty" do 
      click_button "REGISTER"
      expect(page).to have_content("Username can't be blank")
    end

    it "displays an error when the email field is empty" do 
      click_button "REGISTER"
      expect(page).to have_content("Email can't be blank")
    end  

    it "displays an error when the password field is empty" do 
      click_button "REGISTER"
      expect(page).to have_content("Password can't be blank")
    end  

    describe "validating uniqueness of email and username" do 
      let(:user) { FactoryGirl.create(:user) }

      before do 
        fill_in "First Name", with: "Michael"
        fill_in "Last Name", with: "McDevitt"
        fill_in "Username", with: user.username
        fill_in "Email Address", with: "mmcdevi1@gmail.com"
        fill_in "Password", with: "koplop"
        fill_in "Confirm Password", with: "koplop"
        click_button "REGISTER"
      end

      it "displays an error when someone registers a username that already exists" do     
        expect(page).to have_content("Username has already been taken")
      end

      it "displays an error when someone registers an email that already exists" do 
        expect(page).to have_content("Email has already been taken")
      end
    end
  end
end

































