class CreateAcademicAwards < ActiveRecord::Migration[5.1]
	def change
		create_table :academic_awards do |t|

			t.string :name
			t.string :field
			t.string :description
			t.string :issuing_organism
			t.date :award_date
			t.timestamps
		end
	end
end
