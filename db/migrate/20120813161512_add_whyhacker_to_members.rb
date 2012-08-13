class AddWhyhackerToMembers < ActiveRecord::Migration
  def change
    add_column :members, :whyhacker, :text
  end
end
