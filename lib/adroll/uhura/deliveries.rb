require 'adroll/uhura/service'

module AdRoll
  module Uhura
    class Deliveries < AdRoll::Uhura::Service
      WHITELIST_PARAMS = [:ad_eids, :adgroup_eids, :advertisable_eid,
                          :breakdowns, :campaign_eids, :currency, :domains,
                          :end_date, :past_days, :start_date].freeze

      def ad(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def adgroup(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def advertisable(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def campaign(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def domain(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def export(params)
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
