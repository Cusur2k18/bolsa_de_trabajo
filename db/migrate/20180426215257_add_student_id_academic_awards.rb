class AddStudentIdAcademicAwards < ActiveRecord::Migration[5.1]
	def change
		add_column :academic_awards, :student_id, :integer
	end
end
