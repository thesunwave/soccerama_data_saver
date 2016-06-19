class Player < ApplicationRecord
  # has_many :matches, primary_key: 'original_id', through: :team
  has_many :events, primary_key: 'original_id'
  belongs_to :team, primary_key: 'original_id', optional: true
end
