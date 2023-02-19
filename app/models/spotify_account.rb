class SpotifyAccount < ApplicationRecord
  belongs_to :user

  validates :username, uniqueness: true
end
