class AddAcademicLevelToStudents < ActiveRecord::Migration[5.1]
	def change
		add_column :students, :academic_level, :integer
	end
end
