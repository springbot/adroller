module AdRoll
  module Api
    class Campaign < AdRoll::Api::Service
      WHITELIST_PARAMS = [:adgroups, :ads, :advertisable, :budget, :campaign,
                          :cpc, :cpm, :end_date, :is_facebook, :is_fb_wca,
                          :is_fbx_newsfeed, :is_retargeting, :max_cpm, :name,
                          :networks, :objective, :start_date, :status,
                          :ui_budget_daily].freeze

      def create(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def clone(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def edit(params)
        call_api(:put, __method__, sanitize_params(params))
      end

      def get(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_adgroups(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_ip_range_exclusions(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def pause(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def pause_ads(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def unpause(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def unpause_ads(params)
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
