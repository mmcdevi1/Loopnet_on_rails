class ContactForDeal < ActiveRecord::Base
  belongs_to :deal 
  belongs_to :user
  belongs_to :contact
end
