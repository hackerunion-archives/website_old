class Ability
  include CanCan::Ability

  def initialize(member)

    member ||= Member.new

    if member.admin?
      can :manage, :all
    elsif member.approved?
      can :read, :all
      can :update, Member, id: member.id
    else
      cannot :read, Member
    end

  end
end
