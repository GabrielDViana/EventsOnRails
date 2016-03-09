class AddTokenToCaps < ActiveRecord::Migration
  def change
    add_column :caps, :token, :string
  end
end
