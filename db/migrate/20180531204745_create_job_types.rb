class CreateJobTypes < ActiveRecord::Migration[5.1]
	def change
		create_table :job_types do |t|
			t.string :area

			t.timestamps
		end
	end
end
