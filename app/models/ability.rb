class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    can :read, Listing
    return unless @user

    if @user&.admin?
      can :manage, :all
      return
    end

    user_abilities
    listing_abilities
  end

  def user_abilities
    can %i[index show edit update destroy], User, id: @user.id
  end

  def listing_abilities
    can :read, Listing
    can %i[new create edit update destroy], Listing, user_id: @user.id
  end
end
