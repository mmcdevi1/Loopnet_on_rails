class Contact < ActiveRecord::Base
	belongs_to :user

  validates :full_name,     presence: true
  validates :email,         presence: true
  validates :phone_number,  presence: true
  validates :job_title,     presence: true
end
