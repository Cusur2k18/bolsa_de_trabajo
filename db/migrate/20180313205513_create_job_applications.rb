class CreateJobApplications < ActiveRecord::Migration[5.1]
	def change
		create_table :job_applications do |t|
			t.integer :student_id
			t.integer :job_id
			t.integer :status
			t.timestamps
		end
	end
end
