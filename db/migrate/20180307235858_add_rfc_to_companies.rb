class AddRfcToCompanies < ActiveRecord::Migration[5.1]
	def change
		add_column :companies, :rfc, :string
	end
end
