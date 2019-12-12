require 'adroll/service'

module AdRoll
  module Prospecting
    class Service < AdRoll::Service
      def service_url
        File.join(AdRoll.prospecting_base_url, self.class.name.demodulize.underscore)
      end

      private

      def perform_post(request_method, request_uri, params)
        HTTParty.send(request_method,
                      request_uri,
                      headers: { 'Content-Type' => 'application/json' },
                      basic_auth: basic_auth,
                      body: params.to_json,
                      debug_output: debug_output)
      end
    end
  end
end
