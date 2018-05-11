class CreateRandomSentences < ActiveRecord::Migration[5.1]
  def change
    create_table :random_sentences do |t|
      t.references :student_level, foreign_key: true
      t.string :sentence

      t.timestamps
    end
  end
end
