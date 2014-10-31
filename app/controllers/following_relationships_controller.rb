class FollowingRelationshipsController < ApplicationController
  def create
    followed_user = User.find(params[:user_id])
    current_user.follow(followed_user)
    redirect_to followed_user
  end

  def destroy
    followed_user = User.find(params[:user_id])
    current_user.unfollow(followed_user)
    redirect_to followed_user
  end
end
