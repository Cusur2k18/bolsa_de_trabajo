class AddCivilStatusToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :civil_status, :integer
  end
end
