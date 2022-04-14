# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_following_relations,
           class_name: 'FollowingRelation',
           foreign_key: 'follower_id',
           dependent: :destroy,
           inverse_of: :follower
  has_many :passive_following_relations,
           class_name: 'FollowingRelation',
           foreign_key: 'followed_id',
           dependent: :destroy,
           inverse_of: :followed
  has_many :followings,
           through: :active_following_relations,
           source: :followed
  has_many :followers,
           through: :passive_following_relations,
           source: :follower

  def follow(user)
    active_following_relations.create(followed_id: user.id)
  end

  def unfollow(user)
    active_following_relations.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
