class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :cap, index: true
    end
  end
end
