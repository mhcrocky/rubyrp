# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    if user.has_role? :sysadmin
      can :manage, :all

    elsif user.has_role? :superadmin
      can :manage, Room
      can :manage, Article
      can :manage, Comment
      can :manage, TodoItem
      can :manage, User
      cannot :manage, User, roles: { name: 'sysadmin' }
      cannot :manage, User, roles: { name: 'superadmin' }

    elsif user.has_role? :admin
      can :manage, Room
      can :manage, Article
      can :manage, Comment
      can :manage, TodoItem, user_id: user.id
      can :read,   User

    elsif user.has_role? :member
      can :read,   Room
      can :manage, Room, user_id: user.id
      can :read,   Article
      can :manage, Article, user_id: user.id
      can :read,   Comment
      can :manage, Comment, user_id: user.id
      can :manage, Comment, article: { user: { id: user.id } }
      can :manage, TodoItem, user_id: user.id
      can :read,   User

    else # visitors(default sign_up role)
      can :read,   Room
      can :read,   Article
      can :manage, Article, user_id: user.id
      can :read,   Comment
      can :manage, Comment, user_id: user.id
      can :manage, Comment, article: { user: { id: user.id } }
      can :manage, TodoItem, user_id: user.id
      can :read,   User
    end

  end
end
