class Question < ActiveRecord::Base

  validates :manga_id, presence: true, numericality: {
            only_integer: true, greater_than: 0
          }

  validates :sentence, presence: true, length: { maximum: 140 }

  validates :select_1, presence: true, length: { maximum: 20 }

  validates :select_2, presence: true, length: { maximum: 20 }

  validates :select_3, presence: true, length: { maximum: 20 }

  validates :select_4, presence: true, length: { maximum: 20 }

  validates :correct_answer, presence: true, numericality: {
            only_integer: true, greater_than: 0, less_than: 5
          }

end
