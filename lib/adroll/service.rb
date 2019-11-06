require 'json'

module AdRoll
  class Service
    attr_accessor :client

    # Override Object's clone method and pass to method_missing
    def self.clone(params)
      method_missing(:clone, params)
    end

    def self.method_missing(meth, *args)
      # @TODO add logging functionality and put deprecation warnings here
      klass = new
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

    def demo_mode
      Rails.env.demo? || Rails.env.development? # TODO: remove development
    end

    # Pass in addtional_query_params if you need query parameters on url for 
    # HTTP requests that require you to pass in form body
    def call_api(request_method, endpoint, params, additional_query_params = nil)
      request_uri = File.join(service_url, endpoint.to_s)
      response = make_api_call(request_method, request_uri, params, additional_query_params)
      JSON.parse(response.body)
    rescue JSON::ParserError
      { error: 'JSON::ParserError', response: response.body }
    end

    def make_api_call(request_method, request_uri, params, additional_query_params = nil)
      # Include api_key with every call.
      request_uri << "?apikey=#{AdRoll.api_key}"

      if demo_mode
        return_demo_response(request_method, request_uri, params, additional_query_params)
      elsif request_method == :get
        perform_get(request_method, request_uri, params)
      elsif request_uri.include?('/ad/create?')
        perform_multi_post(request_method, request_uri, params)
      elsif additional_query_params.present?
        perform_post_with_query(request_method, request_uri, params, additional_query_params)
      else
        perform_post(request_method, request_uri, params)
      end
    end

    def perform_get(request_method, request_uri, params)
      # For get requests, format the query params as defined by the AdRoll
      # Spec - lists should be ?param=PARAM1,PARAM2
      ::AdRoll::HTTPartyWrapper.send(request_method,
                                     request_uri,
                                     basic_auth: basic_auth,
                                     query: params,
                                     debug_output: debug_output)
    end

    def perform_multi_post(request_method, request_uri, params)
      HTTMultiParty.send(request_method,
                         request_uri,
                         basic_auth: basic_auth,
                         body: params,
                         debug_output: debug_output)
    end

    def perform_post_with_query(request_method, request_uri, params, additional_query_params)
      HTTParty.send(request_method,
                    request_uri,
                    headers: { 'Content-Type' => 'application/json' },
                    basic_auth: basic_auth,
                    query: additional_query_params,
                    body: params,
                    debug_output: debug_output)
    end

    def perform_post(request_method, request_uri, params)
      # Unfortunately, HTTParty applies query_string_normalizer to `body`
      # as well, so revert back to vanilla HTTParty for other requests.
      HTTParty.send(request_method,
                    request_uri,
                    basic_auth: basic_auth,
                    body: params,
                    debug_output: debug_output)
    end

    def return_demo_response(request_method, request_uri, params, additional_query_params)
      puts "ADROLL: return_demo_response(request_method: #{request_method}, request_uri: #{request_uri}, params: #{params}, additional_query_params: #{additional_query_params})" # TODO: remove print statement

      status, data, body_string = demo_response_default

      case request_uri
      when /https:\/\/services[.]adroll[.]com\/activate\/api\/v2\/adgroup.*/
        status, data, body_string = demo_response_put_adgroup(request_method, request_uri, params, additional_query_params) if request_method == :put
      end

      demo_response = Net::HTTPOK.new("1.1", status, body_string)
      demo_response.define_singleton_method(:body) { body_string }

      HTTParty::Response.new(HTTParty::Request.new(request_method, request_uri), demo_response, -> { { "data" => data } })
    end

    def demo_response_default
      status = 200
      data = []
      body_string = "{\"message\":\"\",\"status\":#{status},\"data\":\"\"}"
      [status, data, body_string]
    end

    def demo_response_put_adgroup(request_method, request_uri, params, additional_query_params)
      status = 200
      datum = {
        "ad_type" => "string",
        "ads" => [
        ],
        "campaign_eid" => additional_query_params[:eid],
        "eid": "abc",
        "end_date": params['end_date'],
        "name": params['name'],
        "objective": "convert",
        "start_date": params['start_date'],
        "status": params['status'],
      }
      body_string = "{\"message\":\"\",\"status\":#{status},\"data\":#{JSON.dump(datum)}}"
      [status, [datum], body_string]
    end
  end
end
