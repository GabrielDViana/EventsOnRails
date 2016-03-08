class AddEventDatetimeToCaps < ActiveRecord::Migration
  def change
    add_column :caps, :start_at, :date
    add_column :caps, :end_at, :date
    add_column :caps, :time_start, :time
    add_column :caps, :time_end, :time
    add_column :caps, :meetings, :integer
    add_column :caps, :observations, :string
  end
end
