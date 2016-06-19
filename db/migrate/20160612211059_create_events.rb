class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :original_id
      t.references :match, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :minute
      t.integer :assist_id
      t.integer :related_event_id
      t.integer :player_in_id
      t.integer :player_out_id
      t.string :extra_min
      t.string :event_type
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
