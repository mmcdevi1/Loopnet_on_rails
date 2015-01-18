class CreateAddToPipelines < ActiveRecord::Migration
  def change
    create_table :add_to_pipelines do |t|
      t.integer :user_id
      t.integer :deal_id

      t.timestamps
    end
    add_index :add_to_pipelines, :user_id
    add_index :add_to_pipelines, :deal_id
  end
end
