require 'rails_helper'

RSpec.describe SurvivorsController, type: :controller do

  let(:valid_data) do
    { name: 'Test Survivor',
      age: 20,
      gender: 'male',
      last_location: '2.3,1.0',
      inventory: 'Water:5,Food:11' }
  end

  let(:invalid_data) do
    { name: nil,
      age: nil,
      gender: 'alien',
      inventory: nil }
  end

  describe 'GET #index' do
    it 'returns http 200 success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns all registered survivors' do
      create_list :survivor, 4

      get :index
      expect(json.length).to be 4
    end
  end

  describe 'POST #create' do
    context 'with valid data' do
      it 'returns http 201 created' do
        post :create, params: valid_data
        expect(response).to have_http_status :created
      end

      it 'returns the registered Survivor' do
        post :create, params: valid_data
        expect(json['name']).to eq valid_data[:name]
      end

      it 'registers a new survivor' do
        expect {
          post :create, params: valid_data
        }.to change { Survivor.count }
      end

      it 'registers a new inventory' do
        expect {
          post :create, params: valid_data
        }.to change { Inventory.count }
      end

      it 'registers new stacks' do
        expect {
          post :create, params: valid_data
        }.to change { Stack.count }
      end
    end
    context 'with invalid data' do
      it 'returns http 422 unprocessable entity' do
        post :create, params: invalid_data
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        post :create, params: invalid_data
        expect(json['error']).to be_a String
      end

      it 'does not register a new survivor' do
        expect {
          post :create, params: invalid_data
        }.to_not change { Survivor.count }
      end

      it 'does not register a new inventory' do
        expect {
          post :create, params: invalid_data
        }.to_not change { Inventory.count }
      end

      it 'does not register new stacks' do
        expect {
          post :create, params: invalid_data
        }.to_not change { Stack.count }
      end
    end
  end

  describe 'PUT #update' do
    let(:survivor) { create :survivor }

    it 'returns http 200 ok' do
      put :update, params: { id: survivor,
                             last_location: valid_data[:last_location] }
      expect(response).to have_http_status :ok
    end

    it 'changes a survivor location' do
      expect do
        put :update, params: { id: survivor,
                               last_location: valid_data[:last_location] }
        survivor.reload
      end.to change { survivor.latitude }
    end
  end

  describe 'POST #report' do
    let(:infected) { create :survivor }
    let(:reporter) { create :survivor }

    it 'returns http 200 ok' do
      post :report, params: { id: infected, by: reporter }
      expect(response).to have_http_status :ok
    end

    it 'creates a report' do
      expect do
        post :report, params: { id: infected, by: reporter }
      end.to change { Report.count }
    end
  end
end
