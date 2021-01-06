# frozen_string_literal: true

class AddUniqueIndexToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_index :favorites, %i[user_id image_id], unique: true
  end
end
