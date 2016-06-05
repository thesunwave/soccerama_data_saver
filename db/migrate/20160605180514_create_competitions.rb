class CreateCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :competitions do |t|
      t.integer :original_competition_id
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
