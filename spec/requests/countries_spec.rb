
require 'rails_helper'

describe 'Countries API', type: :request do
  it 'returns all countries' do
    FactoryBot.create(:country, name: 'Zambia', alpha2_code: 'ZM', alpha3_code: 'ZMB')
    get '/v1/countries'

    expect(response).to have_http_status(:success);
    # puts JSON.parse(response.body);
    expect(JSON.parse(response.body).size).to eq(1);
  end
end