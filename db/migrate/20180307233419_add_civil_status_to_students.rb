class AddCivilStatusToStudents < ActiveRecord::Migration[5.1]
	def change
		add_column :students, :civil_status, :integer
	end
end
