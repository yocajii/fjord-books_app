# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :followings, class_name: 'FollowRelation', foreign_key: 'followee_id', dependent: :destroy, inverse_of: :follower
  has_many :followers, class_name: 'FollowRelation', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :followee
  has_many :following_users, through: :followings, source: :follower
  has_many :follower_users, through: :followers, source: :followee
end

def follow(user_id)
  followers.create(followee_id: user_id)
end

def unfollow(user_id)
  followers.find_by(followed_id: user_id).destroy
end

def following?(user)
  following_users.include?(user)
end
