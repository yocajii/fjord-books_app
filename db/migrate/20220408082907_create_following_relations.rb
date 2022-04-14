# frozen_string_literal: true

class CreateFollowingRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :following_relations do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :followed, foreign_key: { to_table: :users }

      t.timestamps

      t.index %i[follower_id followed_id], unique: true
    end
  end
end
