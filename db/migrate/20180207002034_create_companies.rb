class CreateCompanies < ActiveRecord::Migration[5.1]
	def change
		create_table :companies do |t|
			t.string :company_name
			t.string :contact_first_name
			t.string :contact_last_name
			t.string :contact_last_m_name
			t.string :contact_employement
			t.boolean :is_validated

			t.timestamps
		end
	end
end
