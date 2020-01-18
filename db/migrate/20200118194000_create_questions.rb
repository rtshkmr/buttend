class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :module_code
      t.text :question_body
      t.text :answer_body
      t.boolean :answered
      t.string :asker_id

      t.timestamps
    end
  end
end
