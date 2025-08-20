module Preview
  class PreviewController < Preview::ApplicationController

    def index
      @api_url = Rails.env.production? ? 'https://galc-api.ucblib.org' : 'http://localhost:3000'
    end
  end
end
