class AddTitleAndActivatedToContributors < ActiveRecord::Migration
  def change
    add_column :contributors, :title, :string
    add_column :contributors, :activated, :integer
  end
end
