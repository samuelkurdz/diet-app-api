require 'rails_helper'

describe AuthenticationTokenService do
  describe '.call' do
    let(:token) { described_class.call(1) };

    it 'returns an auth token' do
      decoded_token = JWT.decode(
        token,
        described_class::HMAC_SECRET,
        true,
        { algorithm: described_class::ALGORITHM_TYPE }
      );
      expect(decoded_token).to eq(
        [
          {"user_id" => 1}, # payload
          {"alg" => "HS256"} # header
        ]
      )
    end
  end
end