class CreateAnnouncementTable < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.references :member
      t.boolean :approved, null: false, default: false
      t.timestamps
    end
  end
end
