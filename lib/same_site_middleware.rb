class SameSiteMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new env

    helper = SameSiteHelper.new(request)
    if helper.disable_ssp?
      options = request.session.options
      options[:secure] = true
      options[:same_site] = :none
    end

    @app.call(env)
  end
end
