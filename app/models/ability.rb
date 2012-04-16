class Ability
  include CanCan::Ability

  def initialize(member)

    member ||= User.new
    can :manage, :all
    #
    #if member.admin?
    #  can :manage, :all
    #elsif !member.pending?
    #  can :read, :all
    #  can :update, :member, :id => member.id
    #else
    #  can :read, :home
    #end

  end
end
