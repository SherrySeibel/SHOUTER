class FollowingRelationshipsController < ApplicationController
  def create
    current_user.follow(followed_user)
    redirect_to followed_user
  end

  def destroy
    current_user.unfollow(followed_user)
    redirect_to followed_user
  end

  private

  def followed_user
    @_followed_user ||= User.find(params[:user_id])
  end
end
