require 'rails_helper'

RSpec.describe "Questions", :type => :request do

  describe "GET /api/v1/questions/naruto" do

    it "invalid path" do
      # GET /api/v1/questions/naruto にアクセスする
      get '/api/v1/questions/naruto'

      # ステータスコードの確認
      expect(response.status).to eq 404
    end
  end
end