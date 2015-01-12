require 'spec_helper'

describe User do

  describe "relationships" do 
    it { should have_many(:deals) }
    it { should have_many(:contacts) }
    it { should have_many(:image_galleries) }
    it { should have_many(:important_docs) }
    it { should have_many(:important_dates) }
    it { should have_many(:conversations) }
  end

  describe "validations" do 
    let(:user) { FactoryGirl.create(:user) }

    it "requires the user to have a firstname" do 
      expect(user).to validate_presence_of(:firstname)
    end

    it "requires the user to have a lastname" do 
      expect(user).to validate_presence_of(:lastname)
    end 

    it "requires the user to have a username" do 
      expect(user).to validate_presence_of(:username)
    end

    it "requires the user to have a unique username" do 
      expect(user).to validate_uniqueness_of(:username)
    end

    it "requires the user to have an email address" do 
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do 
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email to be formatted correctly" do 
      user.email = "mike"
      expect(user).to_not be_valid
    end
  end

end
