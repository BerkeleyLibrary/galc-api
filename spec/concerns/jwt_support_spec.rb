require 'rails_helper'

describe JWTSupport do
  describe :payload_from do
    it 'returns nil for a bad token' do
      expect(JWTSupport.payload_from('Bearer this is not a valid token')).to be_nil
    end
  end

  describe :append_token do
    before do
      # Ensure consistent token timestamps even if tests cross second boundaries
      timestamp = JWTSupport::TOKEN_LIFETIME.from_now.to_i
      allow_any_instance_of(JWTSupport).to receive(:exp_timestamp).and_return(timestamp)
    end

    it 'appends to a URL with existing parameters' do
      payload = {
        uid: '5551215',
        display_name: 'Rachel Roe',
        email: 'rroe@berkeley.test',
        galc_admin: true
      }

      url = 'http://www.lib.example.edu/galc?reserve=5'
      expected_token = JWTSupport.send(:jwt_encode, payload)
      expected_url = "#{url}&token=#{expected_token}"
      actual_url = JWTSupport.append_token(url, payload)
      expect(actual_url).to eq(expected_url)
    end
  end
end
