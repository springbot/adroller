module AdRoll
  class Service
    attr_accessor :client

    # Override Object's clone method and pass to method_missing
    def self.clone(params)
      method_missing(:clone, params)
    end

    def self.method_missing(meth, *args, &block)
      # @TODO add logging functionality and put deprecation warnings here
      klass = self.new
      klass.send(meth, *args)
    end

    def initialize(options = {})
      @client = options.delete(:client)
    end

    def service_method
      AdRoll::Utils.snakecase(self.class.to_s.gsub(/^.*::/, ''))
    end

    private

    def service_url
      raise NotImplementedError
    end

    def basic_auth
      { username: username, password: password }
    end

    def username
      (client && client.user_name) || AdRoll.user_name
    end

    def password
      (client && client.password) || AdRoll.password
    end

    def debug_output
      $stdout if (client && client.debug?) || AdRoll.debug?
    end

    def call_api(request_method, endpoint, query_params)
      request_uri = File.join(service_url, endpoint.to_s)

      if request_method == :get
        # For get requests, format the query params as defined by the AdRoll
        # Spec - lists should be ?param=PARAM1,PARAM2
        response = ::HTTPartyWrapper.send(request_method, request_uri,
                                 basic_auth: basic_auth, query: query_params, debug_output: debug_output)
      else
        if request_uri == 'https://api.adroll.com/v1/ad/create'
          response = HTTMultiParty.send(request_method, request_uri,
                                        basic_auth: basic_auth, body: query_params, debug_output: debug_output)

        else
          # Unfortunately, HTTParty applies query_string_normalizer to `body`
          # as well, so revert back to vanilla HTTParty for other requests.
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
