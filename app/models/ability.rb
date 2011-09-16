class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'moderator'
      can [:create, :read], Issue
      can :manage, Note
    elsif user.role == 'user'
      can [:create, :read], :all
      can :manage, Issue, :user_id => user.id
    else
      can :read, [Issue, Note]
    end
  end
end
