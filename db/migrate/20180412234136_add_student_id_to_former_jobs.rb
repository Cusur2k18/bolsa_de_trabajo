class AddStudentIdToFormerJobs < ActiveRecord::Migration[5.1]
	def change
		add_column :former_jobs, :student_id, :integer
	end
end
