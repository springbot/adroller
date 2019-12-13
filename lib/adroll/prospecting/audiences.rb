module AdRoll
  module Prospecting
    class Audiences < AdRoll::Prospecting::Service
      WHITELIST_PARAMS = [:size].freeze

      def get(audience_eid)
        call_api(:get, audience_eid, {})
      end

      def edit(audience_eid, params)
        call_api(:post, audience_eid, sanitize_params(params))
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
