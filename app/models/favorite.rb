# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  validates :image_id, uniqueness: { scope: :user_id, message: 'Você já favoritou essa imagem' }
end
