require 'adroll/uhura/service'

module AdRoll
  module Uhura
    class Userlists < AdRoll::Uhura::Service
      WHITELIST_PARAMS = [:breakdowns, :advertisable_eid,
                          :ad_eids, :duration, :start_date, :end_date, :past_days]

      def ad(params)
        call_api(:get, __method__, validate_params(params))
      end

      def adgroup(params)
        call_api(:get, __method__, validate_params(params))
      end

      def advertisable(params)
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
