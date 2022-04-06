# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  validate :validate_avatar, if: :attached?

  private

  def validate_avatar
    types = %w[image/jpeg image/png image/gif]
    errors.add(:avatar, 'に登録できるファイルはjpeg/png/gifのいずれかです') unless avatar.content_type.in?(types)
  end

  def attached?
    avatar.attached?
  end
end
