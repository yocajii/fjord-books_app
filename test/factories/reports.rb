# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    title { '猫の世話' }
    content { 'ブラッシングをした' }
    user factory: :alice
    created_at { 'Sun, 24 Apr 2022 19:53:28.273880000 JST +09:00' }
  end
end
