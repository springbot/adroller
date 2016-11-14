module AdRoll
  module Api
    class Report < AdRoll::Api::Service
      WHITELIST_PARAMS = [:adgroups, :ads, :advertisables, :attributions,
                          :campaigns, :data_format, :end_date, :past_days,
                          :start_date].freeze

      def ad(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def advertisable(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def campaign(params)
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
