class Ability
  include CanCan::Ability

  def initialize(member)

    member ||= Member.new

    if member.admin?
      can :manage, :all
    elsif member.approved?
      can :read, :all
      can :update, Member, id: member.id
      can :create, Event
      cannot :update, Event
      can :create, Announcement
      cannot :update, Announcement
    else
      cannot :read, Member
      cannot :manage, Event
      cannot :manage, Announcement
    end

  end
end
