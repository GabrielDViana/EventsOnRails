class AddDatetimeToCap < ActiveRecord::Migration
    def change
        add_column :caps, :date, :datetime
    end
end
