class Player < ApplicationRecord
  # has_many :matches, primary_key: 'original_id', through: :team
  has_many :events, primary_key: 'original_id'
  has_many :events_in, primary_key: 'original_id', foreign_key: 'player_in_id', class_name: 'Event'
  has_many :events_out, primary_key: 'original_id', foreign_key: 'player_out_id', class_name: 'Event'
  belongs_to :team, primary_key: 'original_id', optional: true

end
