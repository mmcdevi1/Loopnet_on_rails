class ImageGallery < ActiveRecord::Base
	belongs_to :deal
	belongs_to :user

	has_attached_file :deal_images, :default_url => "/assets/office1.jpg", styles: {
		xlarge: "1200x800#",
    large: "848x600#",
    medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"
  }
  validates_attachment_content_type :deal_images, :content_type => /\Aimage/
end
