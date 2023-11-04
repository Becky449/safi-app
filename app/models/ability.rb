
class Ability
  include CanCanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    # Define abilities for a guest user here
    can :read, Agrovet, user_id: user.id

    # Define abilities for the user here
    return unless user.present?

    # If the user is an admin, grant them full management abilities
    if user.admin?
      can :manage, :all
    end

    # Define other abilities as needed for non-admin users

    # Example: Allow users to read articles only if they are published
    # can :read, Article, published: true
  end
end
