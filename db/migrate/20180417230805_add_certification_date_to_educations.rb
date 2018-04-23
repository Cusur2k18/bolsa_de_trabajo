class AddCertificationDateToEducations < ActiveRecord::Migration[5.1]
	def change
		add_column :educations, :certification_date, :date
	end
end
