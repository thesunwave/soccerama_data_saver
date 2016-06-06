class Team < ApplicationRecord
  belongs_to :season, primary_key: 'original_id'
  has_many :matches, primary_key: 'original_id'

  validates :original_id, presence: true, uniqueness: true
end
