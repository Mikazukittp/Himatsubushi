module Api
  module V1
    class QuestionController < ApplicationController
      def return_array
        questions = Question.where(manga_id: params[:id]).to_a

        render :json => {
          question_array: questions.shuffle.take(10)
        }
      end
    end
  end
end