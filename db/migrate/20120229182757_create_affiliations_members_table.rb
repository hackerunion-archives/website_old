class CreateAffiliationsMembersTable < ActiveRecord::Migration

  def change
    create_table :affiliations_members, :id => false do |t|
      t.references :affiliation, :member
    end

  end

end
