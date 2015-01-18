class Deal < ActiveRecord::Base
  
	has_many :contacts, :dependent => :destroy
	has_many :image_galleries, :dependent => :destroy
	has_many :important_docs, :dependent => :destroy
  has_many :important_dates, :dependent => :destroy
  has_many :contact_for_deals, :dependent => :destroy
  has_many :add_to_pipelines, :dependent => :destroy
	belongs_to :user

	validates :property_name, presence: true
  
  accepts_nested_attributes_for :contacts
  accepts_nested_attributes_for :contact_for_deals
	accepts_nested_attributes_for :image_galleries, 
																reject_if: proc { |attributes| attributes['deal_images'].blank? }, 
																allow_destroy: true

  
end
