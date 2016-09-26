require 'adroll/service'

module AdRoll
  module Uhura
    class Attributions < AdRoll::Uhura::Service
      WHITELIST_PARAMS = [:breakdowns, :advertisable_eid, :segment_eids, :adgroup_eids,
                          :ad_eids, :start_date, :end_date, :past_days, :currency]

      def ad(params)
        call_api(:get, __method__, validate_params(params))
      end

      def adgroup(params)
        call_api(:get, __method__, validate_params(params))
      end

      def advertisable(params)
        call_api(:get, __method__, validate_params(params))
      end

      def export(params)
        call_api(:get, __method__, validate_params(params))
      end

      def segment(params)
        call_api(:get, __method__, validate_params(params))
      end

      private

      def validate_params(params)
        params.reject { |key, value| !WHITELIST_PARAMS.include?(key) || value.nil? }
      end
    end
  end
end
