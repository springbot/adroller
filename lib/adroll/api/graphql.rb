module AdRoll
  module Api
    class Graphql < AdRoll::Api::Service
      WHITELIST_PARAMS = [:operationName, :query, :variables].freeze

      def query(params)
        call_api(:post, __method__, params)
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

      def service_url
        'https://services.adroll.com/reporting/api/v1'
      end

      def sanitize_params(params)
        params.reject do |key, value|
          !WHITELIST_PARAMS.include?(key) || value.nil?
        end
      end
    end
  end
end
