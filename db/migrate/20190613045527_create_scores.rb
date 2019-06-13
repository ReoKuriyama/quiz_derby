class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :question_number, null: :false
      t.integer :bet, null: :false
      t.integer :bet_team, null: :false
      t.references :group, null: :false
      t.integer :score
    end
  end
end
