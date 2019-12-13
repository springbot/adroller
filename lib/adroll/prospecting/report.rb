module AdRoll
  module Prospecting
    class Report < AdRoll::Prospecting::Service
      WHITELIST_PARAMS = [:event_source, :data_format, :start_date, :end_date, :currency, :show_empty,
                          :_escape, :legacy_adgroup_eids, :adgroup_eids, :ad_eids, :advertisable_eid,
                          :legacy_campaign_eids, :campaign_eids, :reports, :locale].freeze

      def ad(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def adgroup(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def assisted(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def campaign(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def gcr(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def insights(params)
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
