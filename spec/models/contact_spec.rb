require 'spec_helper'

describe Contact do

  describe "relationships" do 
    it { should belong_to(:user) }
  end

  describe "validations" do 
    let(:contact) { Contact.create(
                      full_name: "Name", 
                      email: "name@name.com", 
                      phone_number: 123456789, 
                      job_title: "vp", 
                      user_id: 1) 
                  }

    it "requires contact to have full_name" do 
      expect(contact).to validate_presence_of(:full_name)
    end

    it "requires contact to have an email" do
      expect(contact).to validate_presence_of(:email)
    end

    it "requires contact to have a phone_number" do
      expect(contact).to validate_presence_of(:phone_number)
    end

    it "requires contact to have a job_title" do
      expect(contact).to validate_presence_of(:job_title)
    end
  end
  
end
