class Bookmark < ApplicationRecord
  validates :comment, presence: true
  validates :comment, length: { minimum: 6 }
  belongs_to :movie
  belongs_to :list
  validates :movie_id, :list_id, presence: true
  validates :movie_id, uniqueness: { scope: :list_id }
end
