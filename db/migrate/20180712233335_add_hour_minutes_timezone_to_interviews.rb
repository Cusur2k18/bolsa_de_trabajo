class AddHourMinutesTimezoneToInterviews < ActiveRecord::Migration[5.1]
  def change
	  add_column :interviews, :hour, :integer
	  add_column :interviews, :minute, :integer
	  add_column :interviews, :timezone, :integer
  end
end
