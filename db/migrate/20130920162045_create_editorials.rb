class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.text :entry

      t.timestamps
    end
  end
end
