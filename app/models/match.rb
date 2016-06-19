class Match < ApplicationRecord

  belongs_to :team, primary_key: 'original_id', foreign_key: 'home_team_id'
  belongs_to :season, primary_key: 'original_id'
  belongs_to :competition, primary_key: 'original_competition_id'

  has_many :events, primary_key: 'original_id', foreign_key: 'match_id'

  validates :original_id, presence: true, uniqueness: true
end
