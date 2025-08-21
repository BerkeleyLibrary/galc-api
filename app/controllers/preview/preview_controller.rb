module Preview
  class PreviewController < Preview::ApplicationController

    def index
      @api_url = ENV['GALC_API_URL'] || 'http://localhost:3000'
    end
  end
end
