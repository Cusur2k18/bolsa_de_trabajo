class CreateVacancies < ActiveRecord::Migration[5.1]
	def change
		create_table :vacancies do |t|
			t.string :name
			t.string :category
			t.integer :schedule
			t.string :contract_type
			t.time :shift_start
			t.time :shift_end
			t.string :payment
			t.timestamps
		end
	end
end
