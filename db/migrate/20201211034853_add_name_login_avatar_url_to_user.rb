# frozen_string_literal: true

class AddNameLoginAvatarUrlToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :login, :string
    add_column :users, :avatar_url, :string
  end
end
