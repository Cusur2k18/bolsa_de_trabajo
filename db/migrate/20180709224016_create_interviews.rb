class CreateInterviews < ActiveRecord::Migration[5.1]
	def change
		create_table :interviews do |t|
			t.integer :status
			t.date :date
			t.time :hour
			t.timestamps
		end
	end
end
