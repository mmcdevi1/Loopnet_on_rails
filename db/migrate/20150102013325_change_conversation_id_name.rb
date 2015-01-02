class ChangeConversationIdName < ActiveRecord::Migration
  def change
    remove_column :messages, :converstaion_id
    add_column :messages, :conversation_id, :integer
  end
end
