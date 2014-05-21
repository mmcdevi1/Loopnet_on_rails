class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :property_name
      t.integer :user_id
      t.string :property_address
      t.string :state
      t.string :city
      t.string :zipcode

      t.timestamps
    end
  end
end
