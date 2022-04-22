# frozen_string_literal: true

class FollowingRelation < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower, uniqueness: { scope: %i[follower followed] }, presence: true
end
