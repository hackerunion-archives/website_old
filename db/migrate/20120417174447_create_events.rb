class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.time :start_time
      t.time :end_time
      t.bool :approved, :default => false
      t.integer :member_id

      t.timestamps
    end
  end
end
