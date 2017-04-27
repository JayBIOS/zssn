require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  describe 'GET #infected' do
    it 'returns http success' do
      get :infected
      expect(response).to have_http_status(:success)
    end

    it 'returns the percentage of infected survivors' do
      create :survivor, :infected
      get :infected
      expect(json['percentage']).to eq 25
    end
  end

  describe 'GET #non_infected' do
    it 'returns http success' do
      get :non_infected
      expect(response).to have_http_status(:success)
    end

    it 'returns the percentage of non-infected survivors' do
      create :survivor, :infected
      get :non_infected
      expect(json['percentage']).to eq 75
    end
  end

  describe 'GET #average_resource' do
    it 'returns http success' do
      get :average_resource
      expect(response).to have_http_status(:success)
    end

    it 'returns the average amount of each kind of Item by survivor' do
      create :survivor, :with_items
      create :survivor
      get :average_resource
      expect(json['average']['Water']).to eq(0.5)
    end
  end

  describe 'GET #points_lost' do
    it 'returns http success' do
      get :points_lost
      expect(response).to have_http_status(:success)
    end

    it 'returns the number of points lost because of the infected' do
      create :survivor, :infected, :with_items
      get :points_lost

      # Water = 4 points. By default a built Survivor has 5 stacks of water.
      # By default a built Survivor has an inventory worth 20 points.
      expect(json['points_lost']).to eq(20)
    end
  end

end
