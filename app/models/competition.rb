class Competition < ApplicationRecord
  has_many :seasons, primary_key: 'original_competition_id'
  has_many :matches, through: :seasons, primary_key: 'original_competition_id'

  validates :original_competition_id, presence: true, uniqueness: true
end
