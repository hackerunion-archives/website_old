class RenameStartAndEndOnEvent < ActiveRecord::Migration
  def change
    rename_column :events, :start_time, :starts
    rename_column :events, :end_time, :ends
  end
end
