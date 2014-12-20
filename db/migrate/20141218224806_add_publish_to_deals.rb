class AddPublishToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :publish, :boolean, default: false
  end
end
