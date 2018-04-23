class AddProfessionalLicenseToEducations < ActiveRecord::Migration[5.1]
	def change
		add_column :educations, :professional_license_type, :integer
	end
end
