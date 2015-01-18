class CreateContactForDeals < ActiveRecord::Migration
  def change
    # drop_table :contact_for_deals
    create_table :contact_for_deals do |t|
      t.integer :deal_id
      t.integer :user_id
      t.integer :contact_id

      t.timestamps
    end
    add_index :contact_for_deals, :deal_id
    add_index :contact_for_deals, :user_id
    add_index :contact_for_deals, :contact_id
  end
end
