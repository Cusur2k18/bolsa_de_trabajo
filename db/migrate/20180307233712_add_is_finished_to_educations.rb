class AddIsFinishedToEducations < ActiveRecord::Migration[5.1]
	def change
		add_column :educations, :is_finished, :boolean
	end
end
