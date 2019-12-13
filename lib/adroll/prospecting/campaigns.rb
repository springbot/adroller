module AdRoll
  module Prospecting
    class Campaigns < AdRoll::Prospecting::Service
      WHITELIST_PARAMS = [:event_source, :active_adgroups_only, :admin_notes, :admin_status,
                          :contextual_targeting_categories, :currency_code, :end_date, :frequency_cap,
                          :is_active, :kpi_goal, :kpi_metric, :name, :source, :start_date, :targeting_type,
                          :user_status, :vcpc, :vcpx, :weekly_budget, :ads, :attribute_targets,
                          :attribute_targets_segment, :auto_audience, :auto_geo_targets, :device_targets,
                          :geo_targets].freeze

      def get(campaign_eid, params)
        call_api(:get, campaign_eid, sanitize_params(params))
      end

      def edit(campaign_eid, params)
        call_api(:post, campaign_eid, sanitize_params(params))
      end

      def get_adgroups(campaign_eid, params)
        path = File.join(campaign_eid, "adgroups")
        call_api(:get, path, sanitize_params(params))
      end

      def create_adgroup(campaign_eid, params)
        path = File.join(campaign_eid, "adgroups")
        call_api(:post, path, sanitize_params(params))
      end

      def get_geo_targets(campaign_eid, params)
        path = File.join(campaign_eid, "geo-targets")
        call_api(:get, path, sanitize_params(params))
      end

      private

      def sanitize_params(params)
        return params if params.kind_of?(Array)
        params.reject do |key, value|
          !WHITELIST_PARAMS.include?(key) || value.nil?
        end
      end
    end
  end
end
