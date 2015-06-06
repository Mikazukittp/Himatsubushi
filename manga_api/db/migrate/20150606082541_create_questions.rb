class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :manga_id
      t.string :sentence
      t.string :select_1
      t.string :select_2
      t.string :select_3
      t.string :select_4
      t.integer :correct_answer

      t.timestamps
    end
  end
end