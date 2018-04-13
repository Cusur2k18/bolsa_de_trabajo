class AddActivitiesToFormerJobs < ActiveRecord::Migration[5.1]
	def change
		add_column :former_jobs, :activities, :string
	end
end
