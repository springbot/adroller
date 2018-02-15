module AdRoll
  module Api
    class DynamicTemplateCapabilityDescription < AdRoll::Api::Service
      WHITELIST_PARAMS = [].freeze

      def get_all(params = {})
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
