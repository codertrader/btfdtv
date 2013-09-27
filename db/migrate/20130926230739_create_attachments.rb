class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :stream_id
      t.string :name
      t.string :link
      t.integer :bytes
      t.string :icon
      t.string :thumbnails_64x64
      t.string :thumbnails_200x200
      t.string :thumbnails_640x480

      t.timestamps
    end
  end
end
