require 'adroll/service'

module AdRoll
  module Api
    class UniversalCampaigns < AdRoll::Api::Service
      ADGROUP_QUERY_PARAMS = %i[eid campaign_eid].freeze

      ADGROUP_JSON_PARAMS = %i[ads end_date kpi_goal ad_type
                               email targeting_features kpi_metric
                               start_date name status campaign_eid
                               created_at eid objective fb_placements
                               li_audience_network_enabled].freeze

      ADGROUP_AD_QUERY_PARAMS = %i[adgroup_eid ad_eid].freeze

      ADGROUP_AD_JSON_PARAMS = %i[eid status].freeze

      CAMPAIGN_QUERY_PARAMS = %i[advertisable_eid eid].freeze

      CAMPAIGN_JSON_PARAMS = %i[name kpi_goal budget currency objective
                                adgroups kpi_metric status budget_settings
                                advertisable_eid eid].freeze

      def adgroup(params, additional_query_params, method = :get)
        if method == :get
          call_api(method, __method__, sanitize_params(params, ADGROUP_QUERY_PARAMS))
        else
          call_api(
            method,
            __method__,
            sanitize_params(params, ADGROUP_JSON_PARAMS).to_json,
            sanitize_params(additional_query_params, ADGROUP_QUERY_PARAMS)
          )
        end
      end

      def adgroup_ad(params, additional_query_params, method = :put)
        call_api(
          method,
          __method__,
          sanitize_params(params, ADGROUP_AD_JSON_PARAMS).to_json,
          sanitize_params(additional_query_params, ADGROUP_AD_QUERY_PARAMS)
        )
      end

      def campaign(params, additional_query_params, method = :get)
        if method == :get
          call_api(method, __method__, sanitize_params(params, CAMPAIGN_QUERY_PARAMS))
        else
          call_api(
            method,
            __method__,
            sanitize_params(params, CAMPAIGN_JSON_PARAMS).to_json,
            sanitize_params(additional_query_params, CAMPAIGN_QUERY_PARAMS)
          )
        end
      end

      private

      def service_url
        'https://services.adroll.com/activate/api/v2'
      end

      # end_date/KPI goal is allowed to be nil for adgroups, that is why this exception is here.
      def sanitize_params(params, whitelist_constant)
        params.reject do |key, value|
          !whitelist_constant.include?(key) || (%i[end_date kpi_goal].include?(key) ? false : value.nil?)
        end
      end
    end
  end
end
