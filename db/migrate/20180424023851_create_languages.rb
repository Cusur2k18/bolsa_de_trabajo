class CreateLanguages < ActiveRecord::Migration[5.1]
	def change
		create_table :languages do |t|

			t.string :name
			t.string :language_level
			t.string :has_certificate
			t.string :issuing_organism
			t.timestamps
		end
	end
end
