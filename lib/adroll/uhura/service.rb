require 'adroll/service'

module AdRoll
  module Uhura
    class Service < AdRoll::Service
      def service_url
        File.join(AdRoll.uhura_base_url, self.class.name.demodulize.underscore)
      end

      def call_api(request_method, endpoint, query_params)
        request_uri = File.join(service_url, endpoint.to_s)
        response = make_api_call(request_method, request_uri, query_params)
        JSON.parse(response.body)
      rescue JSON::ParserError
        { error: 'JSON::ParserError', response: response.body }
      end
    end
  end
end
