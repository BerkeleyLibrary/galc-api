require 'jwt'

module JWTSupport
  extend ActiveSupport::Concern

  BEARER_TOKEN_RE = /^Bearer (?<token>.+)$/
  TOKEN_PARAM = 'token'.freeze
  TOKEN_LIFETIME = 7.days
  ALG = 'HS256'.freeze

  class << self
    include JWTSupport
  end

  def bearer_token_payload
    payload_from(request.headers['Authorization'])
  end

  def payload_from(header)
    return unless header
    return unless (md = BEARER_TOKEN_RE.match(header))

    jwt_decode(md[:token])
  end

  def append_token(url, payload)
    URI.parse(url).tap do |uri|
      params = param_hash_from(uri)
      params[TOKEN_PARAM] = jwt_encode(payload)
      uri.query = URI.encode_www_form(params)
    end.to_s
  end

  private

  def param_hash_from(uri)
    return {} unless (query = uri.query)

    CGI.parse(query)
  end

  def jwt_encode(payload)
    payload[:exp] = exp_timestamp
    JWT.encode(payload, secret_key, ALG)
  end

  def exp_timestamp
    TOKEN_LIFETIME.from_now.to_i
  end

  def jwt_decode(token)
    payload, = JWT.decode(token, secret_key, true, { algorithm: ALG })
    payload
  rescue JWT::DecodeError
    nil
  end

  def secret_key
    Rails.application.secret_key_base
  end
end
