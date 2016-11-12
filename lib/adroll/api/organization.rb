module AdRoll
  module Api
    class Organization < AdRoll::Api::Service
      WHITELIST_PARAMS = [:organization].freeze

      def get(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_advertisables(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_billing_methods(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_users(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      # undocumented
      def reset(params)
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
