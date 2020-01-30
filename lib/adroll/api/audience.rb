module AdRoll
  module Api
    class Audience < AdRoll::Api::Service
      WHITELIST_PARAMS = [:first_party, :third_party, :source, :categorized].freeze

      def user_attribute_names(advertisable_eid, params)
        call_api(:get, "#{__method__}/#{advertisable_eid}", sanitize_params(params))
      end

      private

      def service_url
        'https://services.adroll.com/audience/v1'
      end

      def sanitize_params(params)
        params.reject do |key, value|
          !WHITELIST_PARAMS.include?(key) || value.nil?
        end
      end
    end
  end
end
