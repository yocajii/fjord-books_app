# frozen_string_literal: true

class AddPostcodeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postcode, :string
  end
end
