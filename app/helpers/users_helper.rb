module UsersHelper
  def follow_button user
    button_to "Follow #{@user.username}", user_following_relationships_path(user)
  end
end
