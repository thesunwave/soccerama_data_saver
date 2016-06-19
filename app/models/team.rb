class Team < ApplicationRecord
  belongs_to :season, primary_key: 'original_id'
  has_many :matches, primary_key: 'original_id', foreign_key: 'home_team_id'
  has_many :events, primary_key: 'original_id'
  has_many :players, primary_key: 'original_id'

  validates :original_id, presence: true, uniqueness: true
end
