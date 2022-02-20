
# require 'rails_helper'

# describe 'users API', type: :request do
#   before :all do
#     FactoryBot.create(:country, name: 'Yemen', alpha2_code: 'YE', alpha3_code: 'YEM')
#   end

#   it 'returns all users' do
#     FactoryBot.create(
#       :user,
#       userName: "black",
#       firstName: "bolu",
#       lastName: "tomiwa",
#       email: "bolu@gmail.com",
#       password: "samuelbolu@10",
#       country_id: 1
#     )
#     get '/v1/users'

#     expect(response).to have_http_status(:success);
#     expect(response_body.size).to eq(1);
#   end
# end