class AddEmploymentToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :employment, :string
  end
end
