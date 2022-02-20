require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    let (:user) {FactoryBot.create(:user,
      userName: "black",
      firstName: "bolu",
      lastName: "tomiwa",
      email: "bolu@gmail.com",
      password: "samuelbolu@10",
      country_id: 1
    )}

    it 'authenticate the user' do
      puts user;
      post '/v1/auth', params: { "username": user.userName, "password": "samuelbolu@10" };
      expect(response).to have_http_status(:created);
      expect(response_body).to eq(
        {'token' => '1234'}
      )
    end

    it 'returns error when username is missing' do
      post '/v1/auth', params: {"password": "samuelbolu@10" };
      expect(response).to have_http_status(:unprocessable_entity);
    end

    # it 'returns error when password is missing' do
    #   post '/v1/auth', params: { "username": user.userName };
    #   expect(response).to have_http_status(:unprocessable_entity);
    # end
  end
end
