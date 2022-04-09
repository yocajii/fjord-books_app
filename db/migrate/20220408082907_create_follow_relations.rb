# frozen_string_literal: true

class CreateFollowRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_relations do |t|
      t.references :followee, foreign_key: { to_table: :users }
      t.references :follower, foreign_key: { to_table: :users }

      t.timestamps

      t.index %i[followee follower], unique: true
    end
  end
end
