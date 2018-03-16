class AddIndexToUsersRoleableId < ActiveRecord::Migration[5.1]
	def change
		add_index :users, :roleable_id, unique: true
	end
end
