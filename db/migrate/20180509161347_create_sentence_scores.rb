class CreateSentenceScores < ActiveRecord::Migration[5.1]
  def change
    create_table :sentence_scores do |t|
      t.integer :mcm_topic_id
      t.integer :score
      t.string :sentence

      t.timestamps
    end
  end
end
