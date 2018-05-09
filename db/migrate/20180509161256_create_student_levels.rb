class CreateStudentLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :student_levels do |t|
      t.integer :user_id
      t.string :level_name
      t.string :generic_text

      t.timestamps
    end
  end
end
