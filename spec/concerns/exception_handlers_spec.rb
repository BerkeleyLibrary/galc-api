require 'rails_helper'

describe ExceptionHandlers do
  describe :render_jsonapi_internal_server_error do

    let(:response) do
      double(ActionDispatch::Response).tap do |response|
        response_attrs = { headers: { 'Vary' => 'Accept' } }
        %i[status content_type media_type headers body].each do |attr|
          allow(response).to receive(attr) { response_attrs[attr] }
          allow(response).to receive("#{attr}=".to_sym) { |v| response_attrs[attr] = v }
        end
        allow(response).to receive(:reset_body!)
      end
    end

    let(:controller) do
      ApplicationController.new.tap do |controller|
        controller.instance_variable_set(:@_response, response)
      end
    end

    it 'serializes a 500 error including exception backtrace' do
      begin
        raise 'Help I am trapped in a unit test'
      rescue StandardError => e
        ex = e
        controller.send(:render_jsonapi_internal_server_error, e)
      end

      body_actual = response.body[0]
      parsed_response = JSON.parse(body_actual)
      errors = parsed_response['errors']
      expect(errors.size).to eq(1)

      error = errors[0]
      expect(error['detail']).to eq(ex.message)

      meta = error['meta']
      expect(meta['backtrace']).to eq(ex.backtrace)
    end
  end
end
