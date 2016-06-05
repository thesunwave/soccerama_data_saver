class Competition < ApplicationRecord
  has_many :seasons, primary_key: 'original_competition_id'
end
