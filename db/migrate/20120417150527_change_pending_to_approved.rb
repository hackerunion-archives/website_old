class ChangePendingToApproved < ActiveRecord::Migration
  def up
    rename_column :members, :pending, :approved
    change_column_default :members, :approved, :false
  end

  def down
    rename_column :members, :approved, :pending
    change_column_default :members, :pending, :true
  end
end
