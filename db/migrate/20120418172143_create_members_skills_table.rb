class CreateMembersSkillsTable < ActiveRecord::Migration

  def change
    create_table :members_skills, :id => false do |t|
      t.references :member, :skill
    end
    add_index :members_skills, [:member_id, :skill_id]
  end

end
