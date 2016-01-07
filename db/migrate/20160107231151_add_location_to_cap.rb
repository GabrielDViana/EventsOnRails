class AddLocationToCap < ActiveRecord::Migration
    def change
        add_column :caps, :address, :string
        add_column :caps, :latitude, :float
        add_column :caps, :longitude, :float
    end
end
