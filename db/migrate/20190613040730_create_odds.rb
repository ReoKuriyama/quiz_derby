class CreateOdds < ActiveRecord::Migration[5.2]
  def change
    create_table :odds do |t|
      t.integer :group1
      t.integer :group2
      t.integer :group3
      t.integer :group4
      t.integer :group5
      t.integer :group6
    end
  end
end
