# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = create(:user, name: 'アリス')
    @bob = create(:user, email: 'bob@example.com')
  end

  test '#following?_and_@follow' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#followed_by?' do
    assert_not @bob.followed_by?(@alice)
    @alice.follow(@bob)
    assert @bob.followed_by?(@alice)
  end

  test '#unfollow' do
    carol = create(:user)
    dave = create(:user)
    create(:relationship, following: carol, follower: dave)
    assert dave.following?(carol)
    dave.unfollow(carol)
    assert_not dave.following?(carol)
  end

  test '#name_or_email' do
    assert_equal 'アリス', @alice.name_or_email
    assert_equal 'bob@example.com', @bob.name_or_email
  end
end
