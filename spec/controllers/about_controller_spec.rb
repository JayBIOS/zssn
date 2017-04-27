require 'rails_helper'

RSpec.describe AboutController, type: :controller do
  describe 'GET #info' do
    it 'returns http 200 success' do
      get :info
      expect(response).to have_http_status :success
    end

    it 'returns the API version' do
      get :info
      expect(json['version']).to eq Rails.application.config.version
    end
  end
end
