class RemoveHourFromInterviews < ActiveRecord::Migration[5.1]
  def up
	  remove_column :interviews, :hour, :time
  end
  def down
	  add_column :interviews, :hour, :time
  end
end
