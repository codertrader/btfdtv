class CreateDisclaimers < ActiveRecord::Migration
  def change
    create_table :disclaimers do |t|
      t.string :description
      t.text :disclaimer

      t.timestamps
    end
  end
end
