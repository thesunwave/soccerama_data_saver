class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :original_id
      t.references :team, foreign_key: true
      t.string :name
      t.string :nationality
      t.string :birth_country
      t.date :birth_date
      t.string :birth_place
      t.integer :height
      t.integer :weight
      t.string :position

      t.timestamps
    end
  end
end
