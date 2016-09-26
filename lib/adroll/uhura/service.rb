require 'adroll/service'

module AdRoll
  module Uhura
    class Service < AdRoll::Service
      def service_url
        File.join(AdRoll::Api.uhura_base_url, self.class.name.demodulize.underscore)
      end

      def call_api(request_method, endpoint, query_params)
        request_uri = File.join(service_url, endpoint.to_s)

        if request_method == :get
          response = HTTParty.send(request_method, request_uri,
                                   basic_auth: basic_auth, query: query_params, debug_output: debug_output)
        else
          response = HTTParty.send(request_method, request_uri,
                                   basic_auth: basic_auth, body: query_params, debug_output: debug_output)
        end

        begin
          JSON.parse(response.body)
        rescue JSON::ParserError
          { error: 'JSON::ParserError', response: response.body }
        end
      end

    end
  end
end
