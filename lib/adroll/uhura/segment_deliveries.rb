require 'adroll/uhura/service'

module AdRoll
  module Uhura
    class SegmentDeliveries < AdRoll::Uhura::Service
      WHITELIST_PARAMS = [:ad_eids, :adgroup_eids, :advertisable_eid,
                          :breakdowns, :currency, :domains, :end_date,
                          :past_days, :segment_eids, :start_date].freeze

      def advertisable(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def export(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def segment(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      private

      def service_url
        File.join(AdRoll.uhura_base_url, 'segment-deliveries')
      end

      def sanitize_params(params)
        params.reject do |key, value|
          !WHITELIST_PARAMS.include?(key) || value.nil?
        end
      end
    end
  end
end
