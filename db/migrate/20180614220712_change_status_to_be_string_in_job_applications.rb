class ChangeStatusToBeStringInJobApplications < ActiveRecord::Migration[5.1]
  def change
	  change_column :job_applications, :status, :string 
  end
end
