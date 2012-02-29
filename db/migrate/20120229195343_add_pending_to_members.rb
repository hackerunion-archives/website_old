class AddPendingToMembers < ActiveRecord::Migration
  def change
    add_column :members, :pending, :boolean, :null => false, :default => true
  end
end
