class AddAttachmentImageToCap < ActiveRecord::Migration
  def self.up
      change_table :caps do |t|
          t.attachment :cap_image
      end
  end
end
