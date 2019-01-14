require 'rails_helper'

RSpec.describe Api::V1::PropertiesController, type: :controller do
  describe 'index' do
  	before do 
  	  get :index, format: :json
  	end

  	it 'returns http response' do
      expect(response).to be_success
  	end

  	it 'returns all properties' do
  	  expect(JSON.parse(response.body).count).to eq 20 
  	end
  end
end