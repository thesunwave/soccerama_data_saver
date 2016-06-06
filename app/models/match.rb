class Match < ApplicationRecord
  belongs_to :team, primary_key: 'original_id'
  belongs_to :season, primary_key: 'original_id'
  belongs_to :competition, primary_key: 'original_competition_id'
end
