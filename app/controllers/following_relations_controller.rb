# frozen_string_literal: true

class FollowingRelationsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to user
  end
end
