require 'rails_helper'

describe CorsHelper do
  describe :allow? do
    it 'rejects an invalid URI' do
      invalid_uri = 'not a URI'
      expect(CorsHelper.allow?(invalid_uri)).to eq(false)
    end

    it 'returns true for a lib.berkeley.edu origin' do
      source = 'https://www.lib.berkeley.edu/'
      expect(CorsHelper.allow?(source)).to eq(true)
    end

    it 'returns true for a pantheon.berkeley.edu origin' do
      source = 'https://dev.pantheon.berkeley.edu/'
      expect(CorsHelper.allow?(source)).to eq(true)
    end
  end
end
