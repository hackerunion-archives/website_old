class CreateMembersTable < ActiveRecord::Migration

  def change
    create_table :members do |t|
      t.string :name
    end
  end

end
