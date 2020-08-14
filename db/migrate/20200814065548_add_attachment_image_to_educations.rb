class AddAttachmentImageToEducations < ActiveRecord::Migration[6.0]
  def self.up
    change_table :educations do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :educations, :image
  end
end

