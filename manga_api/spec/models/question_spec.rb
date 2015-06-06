require 'rails_helper'

describe String do #本当はQuetionモデルをテストしたい
  describe "example method" do
    example 'テスト用' do
      s = 'aaaa'
      expect(s.size).to eq(4)
    end
  end
end