class Event < ApplicationRecord
  belongs_to :match, primary_key: 'original_id', foreign_key: 'match_id'
  belongs_to :team, primary_key: 'original_id', optional: true
  belongs_to :player, primary_key: 'original_id', optional: true
  belongs_to :player_in, primary_key: 'original_id', foreign_key: 'player_in_id', class_name: 'Player', optional: true
  belongs_to :player_out, primary_key: 'original_id', foreign_key: 'player_out_id', class_name: 'Player', optional: true

end
