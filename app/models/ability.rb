class Ability
  include CanCan::Ability

  def initialize(member)

    member ||= Member.new

    if member.admin?
      can :manage, :all
    elsif member.approved?
      can :read, :all
      can :update, Member, id: member.id
      cannot :update, Event
    else
      cannot :read, Member
      cannot :update, Event
    end

  end
end
