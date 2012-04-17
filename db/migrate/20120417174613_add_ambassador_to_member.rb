class AddAmbassadorToMember < ActiveRecord::Migration
  def change
    add_column :members, :ambassador, :boolean, default: false
  end
end
