class CreateImageGalleries < ActiveRecord::Migration
  def change
    create_table :image_galleries do |t|
    	t.integer :deal_id
    	t.integer :user_id
      t.timestamps
    end
    add_attachment :image_galleries, :deal_images
  end
end
