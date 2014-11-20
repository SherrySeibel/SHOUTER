class Timeline
  def initialize(user)
    @user = user
  end

  def to_partial_path
    "timelines/show"
  end

  def shouts
    Shout.where(user_id: shout_user_ids)
  end

  private

  def shout_user_ids
    @user.followed_user_ids + [@user.id]
  end
end
