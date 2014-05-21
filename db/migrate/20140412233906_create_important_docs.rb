class CreateImportantDocs < ActiveRecord::Migration
  def change
    create_table :important_docs do |t|
    	t.integer :deal_id
    	t.integer :user_id
      t.timestamps
    end
    add_attachment :important_docs, :doc_files
  end
end
