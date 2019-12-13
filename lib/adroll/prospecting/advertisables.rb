module AdRoll
  module Prospecting
    class Advertisables < AdRoll::Prospecting::Service
      WHITELIST_PARAMS = [:is_active, :admin_notes, :admin_status, :ads, :campaign_strategy,
                          :contextual_targeting_categories, :currency_code, :end_date, :event_source,
                          :frequency_cap, :kpi_goal, :kpi_metric, :name, :source, :start_date,
                          :targeting_type, :user_status, :vcpc, :vcpx, :weekly_budget, :ctc_window,
                          :vtc_window].freeze

      def get_campaigns(advertisable_eid, params)
        path = File.join(advertisable_eid, "campaigns")
        call_api(:get, path, sanitize_params(params))
      end

      def create_campaign(advertisable_eid, params)
        path = File.join(advertisable_eid, "campaigns")
        call_api(:post, path, sanitize_params(params))
      end

      def edit_campaigns(advertisable_eid, params)
        path = File.join(advertisable_eid, "campaigns")
        call_api(:patch, path, sanitize_params(params))
      end

      def get_settings(advertisable_eid)
        path = File.join(advertisable_eid, "settings")
        call_api(:get, path, {})
      end

      def edit_settings(advertisable_eid, params)
        path = File.join(advertisable_eid, "settings")
        call_api(:post, path, sanitize_params(params))
      end

      def get_valid_segments(advertisable_eid)
        path = File.join(advertisable_eid, "valid-segments")
        call_api(:get, path, {})
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
