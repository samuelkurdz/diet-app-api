require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    it 'authenticate the user' do
      post '/v1/auth', params: { "username": "red", "password": "samuelbolu@10" };
      expect(response).to have_http_status(:created);
      expect(response_body).to eq(
        {'token' => '1234'}
      )
    end

    it 'returns error when username is missing' do
      post '/v1/auth', params: {"password": "samuelbolu@10" };
      expect(response).to have_http_status(:unprocessable_entity);
    end

    it 'returns error when password is missing' do
      post '/v1/auth', params: { "username": "red" };
      expect(response).to have_http_status(:unprocessable_entity);
    end
  end
end
