class AddHasDegreeToEducations < ActiveRecord::Migration[5.1]
	def change
		add_column :educations, :has_degree, :boolean
	end
end
