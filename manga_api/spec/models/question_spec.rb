require 'rails_helper'

describe Question do #本当はQuetionモデルをテストしたい
  describe "question test" do
    it 'create' do
      question = Question.create(manga_id: 1, sentence: "sentence", select_1: "sentence",
       select_2:"sentence", select_3:"sentence",select_4:"sentence",correct_answer: 2)

      expect(question.nil?).to eq(false)
    end
  end
end