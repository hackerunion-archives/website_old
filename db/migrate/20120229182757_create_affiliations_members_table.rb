class CreateAffiliationsMembersTable < ActiveRecord::Migration

  def change
    create_table :affiliations_members, :id => false do |t|
      t.references :affiliation, :member
    end
    add_index :affiliations_members, [:affiliation_id, :member_id]
  end

end
