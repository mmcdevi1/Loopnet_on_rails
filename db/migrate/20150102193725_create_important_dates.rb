class CreateImportantDates < ActiveRecord::Migration
  def change
    create_table :important_dates do |t|
      t.integer :deal_id
      t.integer :user_id
      t.string :title
      t.string :date

      t.timestamps
    end
    add_index :important_dates, :deal_id
    add_index :important_dates, :user_id
  end
end
