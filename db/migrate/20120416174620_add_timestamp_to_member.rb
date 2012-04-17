class AddTimestampToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :created_at, :datetime
    add_column :members, :updated_at, :datetime

    Member.reset_column_information

    Member.all.each do |account|
      Member.created_at = "2012-01-01".to_datetime
      Member.updated_at = "2012-01-01".to_datetime
      account.save!
    end

    change_column :members, :created_at, :datetime, :null => false
    change_column :members, :updated_at, :datetime, :null => false
  end

  def self.down
    remove_column :members, :created_at
    remove_column :members, :updated_at
  end
end
