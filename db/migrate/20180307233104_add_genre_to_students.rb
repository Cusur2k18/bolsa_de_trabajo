class AddGenreToStudents < ActiveRecord::Migration[5.1]
	def change
		add_column :students, :genre, :integer
	end
end
