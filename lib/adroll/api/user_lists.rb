module AdRoll
  module Api
    class UserLists < AdRoll::Api::Service
      # User Lists endpoints
      WHITELIST_PARAMS = %i[
        breakdowns advertisable_eid ad_eids durations start_date end_date
        past_days adgroup_eids use_uhura segment_eids excluded_segment_eids
        excluded_durations email
      ].freeze

      def ad(params)
        call_api(:get, __method__, params)
      end

      def adgroup(params)
        call_api(:get, __method__, params)
      end

      def advertisable(params)
        call_api(:get, __method__, params)
      end

      def segment(params, method = :get)
        call_api(method, __method__, params)
      end

      # POST request variation of the segments endpoint
      # According to the docs, this can be used for larger dataset
      def segment_post(params)
        call_api(:post, __method__, params)
      end

      private

      def service_url
        'https://services.adroll.com/user-lists/api/v1/userlists'
      end

      def sanitize_params(params)
        params.reject do |key, value|
          !WHITELIST_PARAMS.include?(key) || value.nil?
        end
      end

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
