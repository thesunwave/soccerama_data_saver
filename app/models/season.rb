class Season < ApplicationRecord
  belongs_to :competition, primary_key: 'original_competition_id'
end
