class ChangePropertyTypeToInteger < ActiveRecord::Migration
  def change
    remove_column :deals, :property_type
    add_column :deals, :property_type, :integer
  end
end
