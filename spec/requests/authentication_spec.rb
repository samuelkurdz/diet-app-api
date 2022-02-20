require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    let (:user) {FactoryBot.create(:user,
      userName: "black",
      firstName: "bolu",
      lastName: "tomiwa",
      email: "bolu@gmail.com",
      password: "Password1",
      country_id: 1
    )}

    it 'authenticate the user' do
      post '/v1/auth', params: { "username": user.userName, "password": "Password1" };
      p user.password_digest
      expect(response).to have_http_status(:created);
      expect(response_body).to eq(
        {'token' => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w'}
      )
    end

    it 'returns error when username is missing' do
      post '/v1/auth', params: {"password": "samuelbolu@10" };
      expect(response).to have_http_status(:unprocessable_entity);
    end

    it 'returns error when password is missing' do
      post '/v1/auth', params: { "username": user.userName };
      expect(response).to have_http_status(:unprocessable_entity);
    end

    it 'returns error when password is incorrect' do
      post '/v1/auth', params: { "username": user.userName, "password": "samuelbolu@10" };
      expect(response).to have_http_status(:unauthorized);
    end
  end
end
