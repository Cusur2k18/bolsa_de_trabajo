class CreateJobs < ActiveRecord::Migration[5.1]
	def change 
		create_table :jobs do |t|
			t.string :category
			t.time :workday_schedule_start
			t.time :workday_schedule_end
			t.string :contract_type
			t.integer :workday_type
			t.integer :salary
			t.string :name
			t.string :age_requierement
			t.integer :gender
			t.string :schooling_level
			t.string :work_experience
			t.string :specialized_knowledge
			t.string :aptitudes
			t.integer :job_duration
			t.integer :company_id
			t.timestamps
		end
	end
end
