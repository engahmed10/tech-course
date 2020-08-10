class AddAttachmentImageToTeches < ActiveRecord::Migration[6.0]
  def self.up
    change_table :teches do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :teches, :image
  end
end
