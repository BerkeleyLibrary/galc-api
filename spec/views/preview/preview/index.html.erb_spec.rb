require 'rails_helper'

RSpec.describe 'preview/preview/index', type: :view do
  let(:endpoint) { 'https://galc.oski.cat' }

  it 'sets the API endpoint' do
    assign(:api_url, endpoint)

    render

    assert_select "div#galc-app:match('data-api-base-url', ?)", endpoint
  end
end
