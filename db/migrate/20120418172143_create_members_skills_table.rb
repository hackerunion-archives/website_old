class CreateMembersSkillsTable < ActiveRecord::Migration

  def change
    create_table :members_skills, :id => false do |t|
      t.references :member, :skill
    end
  end

end
