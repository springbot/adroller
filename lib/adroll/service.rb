module AdRoll
  module Api
    class Service
      # API_METADATA = [{}]

      # SERVICE_ATTRIBUTES = []

      def self.respond_to?(method_name, include_all = false)
        if api_endpoints.include?(method_name) ||
          self::SERVICE_ATTRIBUTES.include?(method_name)
          true
        else
          super
        end
      end

      def self.method_missing(method_name, *args, &block)
        if api_endpoints.include?(method_name) ||
          self::SERVICE_ATTRIBUTES.include?(method_name)

          define_singleton_method(method_name) do |request_params|
            call_api(method_name, request_params.first)
          end

          send(method_name, args)
        else
          super
        end
      end

      def self.service_url
        File.join(AdRoll::Api.base_url, to_s.demodulize.downcase)
      end

      def self.basic_auth
        { username: AdRoll::Api.user_name, password: AdRoll::Api.password }
      end

      def self.api_endpoints
        self::API_METADATA.map { |hash| hash[:endpoint] }.flatten
      end

      def self.request_method(endpoint_name)
        self::API_METADATA.find do |metadata|
          metadata[:endpoint] == endpoint_name
        end[:request_method]
      end

      def self.call_api(endpoint, request_params)
        request_uri = File.join(service_url, endpoint.to_s)

        response = HTTParty
          .send(request_method(endpoint), request_uri, request_params)

        JSON.parse(response)
      end
    end
  end
end
