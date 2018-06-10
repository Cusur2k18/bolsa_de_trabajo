class RemoveCategoryFromJobs < ActiveRecord::Migration[5.1]
  def up
	  remove_column :jobs, :category, :string
  end
  def down
	  add_column :jobs, :category , :string
  end
end
