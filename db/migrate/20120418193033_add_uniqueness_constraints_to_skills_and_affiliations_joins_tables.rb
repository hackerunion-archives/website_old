class AddUniquenessConstraintsToSkillsAndAffiliationsJoinsTables < ActiveRecord::Migration
  def change
    add_index :affiliations_members, [ :affiliation_id, :member_id ], :unique => true, :name => 'by_affiliation_and_member'
    add_index :members_skills, [ :member_id, :skill_id ], :unique => true, :name => 'by_member_and_skill'
  end
end
