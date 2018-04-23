class CreateEducations < ActiveRecord::Migration[5.1]
	def change
		create_table :educations do |t|
			t.string :university
			t.string :education_level
			t.string :major
			t.string :admission_date
			t.string :graduation_date
			# foreign key
			t.integer :student_id

			t.timestamps
		end
	end
end
