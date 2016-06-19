class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :competition, foreign_key: true
      t.references :season, foreign_key: true
      t.integer :original_id
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :home_score
      t.integer :away_score
      t.integer :home_score_penalties
      t.integer :away_score_penalties
      t.integer :round_id
      t.datetime :starting_date

      t.timestamps
    end
  end
end
