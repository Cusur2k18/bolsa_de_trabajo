class AddPlaceToInterviews < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :place, :string
  end
end
