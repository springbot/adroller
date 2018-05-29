require 'adroll/service'

module AdRoll
  module Api
    class UniversalCampaigns < AdRoll::Api::Service
      WHITELIST_PARAMS = [:eid, :campaign_eid, :ads, :end_date, :kpi_goal,
                          :ad_type, :email, :targeting_features, :kpi_metric,
                          :start_date, :name, :status, :adgroup_eid, :ad_eid,
                          :advertisable_eid, :budget, :currency, :adgroups].freeze

      def adgroup(params, method = :get)
        call_api(method, __method__, sanitize_params(params))
      end

      def adgroup_ad(params)
        call_api(:put, __method__, sanitize_params(params))
      end

      def campaign(params, method = :get)
        call_api(method, __method__, sanitize_params(params))
      end

      private

      def service_url
        'https://services.adroll.com/activate/api/v2'
      end

      def sanitize_params(params)
        params.reject do |key, value|
          !WHITELIST_PARAMS.include?(key) || value.nil?
        end
      end
    end
  end
end
