module Manga
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    resource :questions do
      desc "sample"
      get :sample do
        p "hogehoge"
      end

    desc "Show"
      params do
        requires :id, type: Integer, desc: "question id."
      end
      route_param :id do
        get do
          p "hugahuga"
        end
      end
    end
  end
end
