module AdRoll
  module Api
    class Pixel < AdRoll::Api::Service
      WHITELIST_PARAMS = [:pixel, :include_audience, :rules].freeze

      def get(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_rules(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_segments(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def reorder_rules(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      private

      def sanitize_params(params)
        params.reject do |key, value|
          !WHITELIST_PARAMS.include?(key) || value.nil?
        end
      end
    end
  end
end
