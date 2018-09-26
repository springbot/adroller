require 'adroll/uhura/service'

module AdRoll
  module Uhura
    class GranularAttributions < AdRoll::Uhura::Service
      WHITELIST_PARAMS = [:advertisable_eid, :start_date, :end_date].freeze

      def combined_granular_attributions(params)
        call_api(:get, __method__.to_s.dasherize, sanitize_params(params))
      end

      private

      def service_url
        AdRoll.uhura_base_url
      end

      def sanitize_params(params)
        params.reject do |key, value|
          !WHITELIST_PARAMS.include?(key) || value.nil?
        end
      end
    end
  end
end
