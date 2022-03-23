require 'rails_helper'

describe CorsHelper do
  describe :allow? do
    it 'rejects an invalid URI' do
      invalid_uri = 'not a URI'
      expect(CorsHelper.allow?(invalid_uri)).to eq(false)
    end
  end
end
