# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :body, null: false

      t.timestamps

      t.references :test, null: false, foreign_key: true
    end
  end
end
