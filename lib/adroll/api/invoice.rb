module AdRoll
  module Api
    class Invoice < AdRoll::Api::Service
      WHITELIST_PARAMS = [:invoice].freeze

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
