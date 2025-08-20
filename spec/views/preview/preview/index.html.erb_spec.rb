require 'rails_helper'

RSpec.describe 'preview/preview#index', type: :view do
  let(:endpoint) { 'https://galc.oski.cat' }

  it 'sets the API endpoint' do
    assign(:api_url, endpoint)

    render

    expect(rendered).to match(/#{endpoint}/)
  end
end
