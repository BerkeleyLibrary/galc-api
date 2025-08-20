require 'rails_helper'

RSpec.describe 'preview routing', type: :routing do
  it 'is not routable with an empty SERVE_TEST_UI' do
    allow(ENV).to receive(:[]).with('SERVE_TEST_UI').and_return(nil)
    expect(get: preview_path).not_to be_routable
  end

  it 'routes to Preview::PreviewController when SERVE_TEST_UI is set' do
    allow(ENV).to receive(:[]).with('SERVE_TEST_UI').and_return('something')
    expect(get: preview_path).to route_to('preview/preview#index')
  end
end
