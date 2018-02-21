class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
	def change
		create_table :phone_numbers do |t|
			t.string :phone_number
			t.string :description
			t.integer :user_id
			t.timestamps
		end
	end
end
