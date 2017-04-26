require 'rails_helper'

RSpec.describe SurvivorsController, type: :controller do

  before :all do
    create :item, name: 'Item1'
    create :item, name: 'Item2'
  end

  let(:valid_data) {
    {
        name: 'Test Survivor',
        age: 20,
        gender: 'male',
        last_location: '2.3,1.0',
        inventory: 'Item1:5,Item2:11'
    }
  }

  let(:invalid_data) {
    {
        name: nil,
        age: nil,
        gender: 'alien',
        inventory: nil
    }
  }

  describe 'POST #create' do
    context 'with valid data' do
      it 'returns http 201 created' do
        post :create, params: valid_data
        expect(response).to have_http_status(:created)
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
end
