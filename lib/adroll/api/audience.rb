module AdRoll
  module Api
    class Audience < AdRoll::Api::Service
      WHITELIST_PARAMS = [:first_party, :third_party, :source, :categorized, :advertiser_id,
                          :name, :type, :source_segment_eid, :duration, :size, :countries,
                          :allow_international_seeds, :attributes, :conversion_value,
                          :data, :is_conversion].freeze

      def user_attribute_names(advertisable_eid, params)
        call_api(:get, "#{__method__}/#{advertisable_eid}", sanitize_params(params))
      end

      def segments(params, segment_id = nil)
        endpoint = segment_id.present? ? "#{__method__}/#{segment_id}" : __method__
        call_api(:post, endpoint, sanitize_params(params))
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
