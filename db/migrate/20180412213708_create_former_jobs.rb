class CreateFormerJobs < ActiveRecord::Migration[5.1]
	def change
		create_table :former_jobs do |t|
			t.string :enterprise_name
			t.string :phone_number
			t.string :address
			t.string :boss_name
			t.string :job_title
			t.integer :first_paycheck
			t.integer :last_paycheck
			t.integer :is_current_job

			t.timestamps
		end
	end
end
