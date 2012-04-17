class DropUserTable < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    raise IrreversibleMigration, "Can't magically recreate Users"
  end
end
