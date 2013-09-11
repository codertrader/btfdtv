class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :name
      t.string :email
      t.string :twitter
      t.string :stocktwits
      t.string :facebook
      t.text :site
      t.text :short_bio
      t.text :full_bio
      t.integer :featured

      t.timestamps
    end
  end

  def rollback
    drop_table :contributors
  end
end
