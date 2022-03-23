require 'rspec'

module CasContexts
  IDS = {
    student: '5551212'.freeze,
    galc_admin: '5551215'.freeze
  }.freeze

  class << self
    def callback_url_from_cas_redirect(cas_login_url, ticket)
      cas_login_uri_actual = URI.parse(cas_login_url)
      service_url_param = CGI.parse(cas_login_uri_actual.query)['service'].first
      URI.parse(service_url_param).tap do |uri|
        params = CGI.parse(uri.query).merge(ticket: ticket)
        uri.query = params.to_query
      end.to_s
    end
  end
end

RSpec.configure do |rspec|
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context('authenticated request', shared_context: :metadata) do
  # This is buried too deep in OmniAuth to mock easily, so we just use
  # the real one (and provide this let() block as a convenience
  let(:cas_host) { Rails.application.config.cas_host }
  let(:cas_base_uri) { URI.parse("https://#{cas_host}") }
  let(:cas_logout_url) { BerkeleyLibrary::Util::URIs.append(cas_base_uri, '/cas/logout').to_s }
  let(:ticket) { 'ST-99-SGVsbG8hIEknbSBhIHRpY2tldCE-auth-t02' }

  let(:origin_url) { 'https://galc.example.test/galc' }
  let(:origin_uri) { URI.parse(origin_url) }

  # assume let(:uid) from outer spec
  let(:cas_raw_xml) { File.read("spec/data/cas/#{uid}.xml") }

  before do
    allow(Rails.application.config).to receive(:hosts).and_return([cas_host, origin_uri.host])
    stub_request(:get, %r{https://#{cas_host}/cas/p3/serviceValidate}).to_return(status: 200, body: cas_raw_xml)

    # Set OmniAuth session variables
    post login_path, params: { origin: origin_url }
    get CasContexts.callback_url_from_cas_redirect(response.headers['Location'], ticket)
  end

  after do
    stub_request(:get, cas_logout_url).to_return(status: 200)
    get logout_path
    expect(session[User::SESSION_KEY]).to be_nil # just to be sure
  end
end

RSpec.shared_context('admin request', shared_context: :metadata) do
  include_context 'authenticated request' do
    let(:uid) { CasContexts::IDS[:galc_admin] }
  end
end

RSpec.shared_context('patron request', shared_context: :metadata) do
  include_context 'authenticated request' do
    let(:uid) { CasContexts::IDS[:student] }
  end
end
