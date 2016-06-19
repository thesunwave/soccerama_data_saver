class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.references :season, foreign_key: true
      t.string :name
      t.string :logo
      t.integer :original_id

      t.timestamps
    end
  end
end
