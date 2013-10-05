class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :stream_id
      t.string :slug

      t.timestamps
    end
  end
end
