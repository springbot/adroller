module AdRoll
  module Api
    class Segment < AdRoll::Api::Service
      WHITELIST_PARAMS = [:conversion_value, :duration, :segment].freeze

      def edit(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def get(params)
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
