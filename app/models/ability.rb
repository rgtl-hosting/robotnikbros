class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :create, User
    case user.role
    when 'admin'
      can :manage, :all
    when 'author'
      can :read, :all
      can :create, Post
      can :manage, Post do |post|
        post.try(:user) == user
      end
      can :create, Comment
      can :manage, Comment do |comment|
        comment.try(:user) == user
      end
    when 'commenter'
      can :read, :all
      can :create, Comment
      can :manage, Comment do |comment|
        comment.try(:user) == user
      end
    end
  end

end
