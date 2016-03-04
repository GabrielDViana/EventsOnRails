class AddAttachmentCurriculumToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :curriculum
    end
  end

  def self.down
    remove_attachment :users, :curriculum
  end
end
