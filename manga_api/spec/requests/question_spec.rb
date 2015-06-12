require 'rails_helper'

RSpec.describe "Questions", :type => :request do

  describe "GET /api/v1/questions/1" do

    it "invalid path" do
      # GET /api/v1/questions/naruto にアクセスする
      get '/api/v1/questions/1'

      # ステータスコードの確認
      expect(response.status).to eq 200

      body = response.body
      expect(body).to have_json_path('question_array')
    end
  end
end