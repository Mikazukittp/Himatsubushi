module Api
  module V1
    class QuestionController < ApplicationController
      def return_array
        render :json => {
          hoge1: 'fuga',
          hoge2: 'fuga',
          hoge3: 'fuga',
          hoge4: 'fuga',
          hoge5: 'fuga'
        }
      end
    end
  end
end