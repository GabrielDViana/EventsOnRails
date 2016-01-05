class CreateCaps < ActiveRecord::Migration
    def change
        create_table :caps do |t|
            t.string :title
            t.string :area

            t.timestamps null: false
        end
    end
end
