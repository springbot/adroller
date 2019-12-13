module AdRoll
  module Prospecting
    class Metrics < AdRoll::Prospecting::Service
      WHITELIST_PARAMS = [:event_source, :start_date, :end_date, :adgroup_ad_eids, :adgroup_eids,
                          :advertisable_eid, :campaign_eids].freeze

      def adgroup_ads(params)
        call_api(:get, "adgroup-ads", sanitize_params(params))
      end

      def adgroups(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def advertisables(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def campaigns(params)
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
