class RemoveDealIdFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :deal_id
  end
end
