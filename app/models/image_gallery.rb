class ImageGallery < ActiveRecord::Base
	belongs_to :deal
	belongs_to :user

	has_attached_file :deal_images, :default_url => "/assets/office1.jpg", styles: {
		xlarge: "1200x800#",
    large: "848x600#",
    medium: "300x200#",
    small: "520x340#",
    thumb: "140x140#"
  }
  validates_attachment_content_type :deal_images, :content_type => /\Aimage/

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:deal_images_file_name),
      "size" => read_attribute(:deal_images_file_size),
      "url" => deal_images.url(:original),
      "thumbnail_url" => deal_images.url(:thumb),
      "delete_url" => read_attribute(:id),
      "delete_type" => "DELETE" 
    }
  end
end
