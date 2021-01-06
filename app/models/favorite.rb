class Favorite < ApplicationRecord
  belongs_to :user
  validates :image_id, uniqueness: { scope: :user_id }
end
