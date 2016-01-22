class AddAddressComplementToCap < ActiveRecord::Migration
  def change
    add_column :caps, :city, :string
    add_column :caps, :state, :string
    add_column :caps, :country, :string
  end
end
