# frozen_string_literal: true

FactoryBot.define do
  factory :relationship do
    following { nil }
    follower { nil }
  end
end
