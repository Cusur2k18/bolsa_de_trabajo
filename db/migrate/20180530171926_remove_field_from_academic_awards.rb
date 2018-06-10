class RemoveFieldFromAcademicAwards < ActiveRecord::Migration[5.1]
	def up
		remove_column :academic_awards, :field, :string
	end

	def down
		add_column :academic_awards, :field, :string
	end
end
