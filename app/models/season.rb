class Season < ApplicationRecord
  belongs_to :competition, primary_key: 'original_competition_id'
  has_many :teams, primary_key: 'original_id'
  has_many :matches, primary_key: 'original_id'

  validates :original_id, presence: true, uniqueness: true
end
