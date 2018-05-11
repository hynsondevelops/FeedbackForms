class CreateMcmTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :mcm_topics do |t|
      t.integer :user_id
      t.string :topic_name

      t.timestamps
    end
  end
end
