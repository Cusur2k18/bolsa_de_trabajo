class AddFoundationDateToCompanies < ActiveRecord::Migration[5.1]
	def change
		add_column :companies, :foundation_date, :date
	end
end
