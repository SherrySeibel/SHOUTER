module UsersHelper
  def follow_button user
    if current_user.following? user
      button_to "Unfollow #{user.username}", user_following_relationships_path(user), method: :delete
    else
      button_to "Follow #{user.username}", user_following_relationships_path(user)
    end
  end
end
