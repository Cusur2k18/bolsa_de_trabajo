class CreateAddresses < ActiveRecord::Migration[5.1]
	def change
		create_table :addresses do |t|
			t.string :state
			t.string :city
			t.string :zip_code
			t.string :street
			t.string :street_address
			t.string :apartment_number
			t.integer :user_id
			t.timestamps
		end
	end
end
