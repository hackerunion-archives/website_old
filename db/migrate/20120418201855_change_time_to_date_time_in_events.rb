class ChangeTimeToDateTimeInEvents < ActiveRecord::Migration
  def change
    remove_column :events, :start_time
    remove_column :events, :end_time
    add_column :events, :starts, :datetime
    add_column :events, :ends, :datetime
  end
end
