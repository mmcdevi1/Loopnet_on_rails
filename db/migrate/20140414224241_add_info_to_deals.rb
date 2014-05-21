class AddInfoToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :owner_name, :string
  	add_column :deals, :floors, :integer
  	add_column :deals, :sf, :integer
  	add_column :deals, :year_built, :integer
  	add_column :deals, :percent_leased, :integer
  	add_column :deals, :property_class, :string
  	add_column :deals, :property_type, :string
  	add_column :deals, :deal_title, :string
  	add_column :deals, :deal_summary, :string
  	
  end
end
