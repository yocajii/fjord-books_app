# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    title { '猫の世話' }
    content { 'ブラッシングをした' }
    user { nil }
  end
end
