class AddUserIdToCaps < ActiveRecord::Migration
    def change
        add_column :caps, :user_id, :integer
    end
end
