class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.references :competition, foreign_key: true
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
