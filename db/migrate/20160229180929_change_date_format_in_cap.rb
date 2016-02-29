class ChangeDateFormatInCap < ActiveRecord::Migration
  def up
    change_column :caps, :date, :date
  end

  def down
    change_column :caps, :date, :datetime
  end
end
