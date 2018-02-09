class AddRoleableToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :roleable_type, :string
  end
end
