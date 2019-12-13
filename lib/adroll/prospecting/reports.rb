module AdRoll
  module Prospecting
    class Reports < AdRoll::Prospecting::Service
      WHITELIST_PARAMS = [:event_source, :advertisable_eid, :start_date, :end_date, :campaign_eids,
                          :data_format, :date].freeze

      def campaign(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def insights_data(params)
        call_api(:get, "insights-data", sanitize_params(params))
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
