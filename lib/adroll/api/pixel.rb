module AdRoll
  module Api
    class Pixel < AdRoll::Api::Service
      WHITELIST_PARAMS = [:pixel, :include_audience, :rules]

      def get(params)
        call_api(:get, __method__, validate_params(params))
      end

      def get_rules(params)
        call_api(:get, __method__, validate_params(params))
      end

      def get_segments(params)
        call_api(:get, __method__, validate_params(params))
      end

      def reorder_rules(params)
        call_api(:get, __method__, validate_params(params))
      end

      private

      def validate_params(params)
        params.reject { |key, value| !WHITELIST_PARAMS.include?(key) || value.nil? }
      end
    end
  end
end
