module AdRoll
  module Api
    class Service
      attr_accessor :client

      # Override Object's clone method and pass to method_missing
      def self.clone(params)
        method_missing(:clone, params)
      end

      def self.method_missing(meth, *args, &block)
        klass = self.new
        klass.send(meth, *args)
      end

      def initialize(options = {})
        @client = options.delete(:client)
      end

      private

      def service_url
        File.join(AdRoll::Api.base_url, self.class.name.demodulize.underscore)
      end

      def basic_auth
        { username: username, password: password }
      end

      def username
        (client && client.user_name) || AdRoll::Api.user_name
      end

      def password
        (client && client.password) || AdRoll::Api.password
      end

      def debug_output
        $stdout if (client && client.debug?) || AdRoll::Api.debug?
      end

      def call_api(request_method, endpoint, query_params)
        request_uri = File.join(service_url, endpoint.to_s)

        if request_method == :get
          response = HTTParty.send(request_method, request_uri,
                                   basic_auth: basic_auth, query: query_params, debug_output: debug_output)
        else
          if request_uri == 'https://api.adroll.com/v1/ad/create'
            response = HTTMultiParty.send(request_method, request_uri,
                                          basic_auth: basic_auth, body: query_params, debug_output: debug_output)

          else
            response = HTTParty.send(request_method, request_uri,
                                     basic_auth: basic_auth, body: query_params, debug_output: debug_output)
          end
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
