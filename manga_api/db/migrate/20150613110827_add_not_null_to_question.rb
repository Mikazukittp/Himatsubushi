class AddNotNullToQuestion < ActiveRecord::Migration
  def change
    change_column_null :questions, :manga_id, false
    change_column_null :questions, :sentence, false
    change_column_null :questions, :select_1, false
    change_column_null :questions, :select_2, false
    change_column_null :questions, :select_3, false
    change_column_null :questions, :select_4, false
    change_column_null :questions, :correct_answer, false
  end
end
