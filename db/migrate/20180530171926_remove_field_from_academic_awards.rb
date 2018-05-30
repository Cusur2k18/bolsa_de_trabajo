class RemoveFieldFromAcademicAwards < ActiveRecord::Migration[5.1]
	def up
		add_column :academic_awards, :field, :string
	end

	def down
		remove_column :academic_awards, :field, :string
	end
end
