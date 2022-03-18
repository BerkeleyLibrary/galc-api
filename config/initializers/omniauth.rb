Rails.application.config.middleware.use OmniAuth::Builder do
  fetch_raw_info = proc do |_strategy, _opts, _ticket, _user_info, rawxml|
    next {} if rawxml.empty?

    groups_txt = rawxml.xpath('//cas:berkeleyEduIsMemberOf').map(&:text)
    affiliations_txt = rawxml.xpath('//cas:berkeleyEduAffiliations').map(&:text)

    { 'berkeleyEduIsMemberOf' => groups_txt, 'berkeleyEduAffiliations' => affiliations_txt }
  end

  provider :cas,
           name: :calnet,
           host: Rails.application.config.cas_host,
           login_url: '/cas/login',
           service_validate_url: '/cas/p3/serviceValidate',
           fetch_raw_info: fetch_raw_info

  # Override the default 'puts' logger that Omniauth uses.
  OmniAuth.config.logger = Rails.logger
end
