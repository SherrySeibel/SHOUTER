class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :shouts

  has_many :text_shouts

  has_many :text_shouts, through: :shouts

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship"
  has_many :followers, through: :follower_relationships

  def follow other_user
    followed_users << other_user
  end

  def unfollow other_user
    followed_users.destroy(other_user)
  end

  def following? other_user
    followed_user_ids.include? other_user.id
  end

  def can_follow? other_user
    self != other_user
  end
end
