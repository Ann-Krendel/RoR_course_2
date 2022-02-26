class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0

      t.timestamps

      t.references :categories, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.references :questions, null: false, foreign_key: true
    end
  end
end
