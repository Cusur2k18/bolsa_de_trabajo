class AddStudentIdJobIdToInterviews < ActiveRecord::Migration[5.1]
	def change
		add_column :interviews, :student_id, :integer
		add_column :interviews, :job_id, :interger
	end
end
