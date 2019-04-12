class AddMoreInfoToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :curp, :string, :default => ""
    add_column :students, :travel_available, :boolean, :default => false
    add_column :students, :relocate_available, :boolean, :default => false
    add_column :students, :office_software, :string, :default => ""
  end
end
