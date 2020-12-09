# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    if user.has_role? :sysadmin
      can :manage, :all

    elsif user.has_role? :superadmin
      can :manage, Article
      can :manage, TodoItem
      can :manage, User
      cannot :manage, User, roles: { name: 'sysadmin' }
      cannot :manage, User, roles: { name: 'superadmin' }
      can :manage, User, id: user.id

    elsif user.has_role? :admin
      can :manage, Article
      can :manage, TodoItem
      can :manage, User
      cannot :manage, User, roles: { name: 'sysadmin' }
      cannot :manage, User, roles: { name: 'superadmin' }
      cannot :manage, User, roles: { name: 'admin' }
      can :manage, User, id: user.id

    else # members .. or anyone else that signs up if no assign_default_role (rolify)
      can :read, Article
      can :manage, Article, user_id: user.id
      can :manage, TodoItem, user_id: user.id
      can :read, User
      can :manage, User, id: user.id
    end

  end
end
