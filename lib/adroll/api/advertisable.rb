module AdRoll
  module Api
    class Advertisable < AdRoll::Api::Service
      WHITELIST_PARAMS = [:advertisable, :blacklist_statuses, :camp_active,
                          :camp_blacklist_statuses, :camp_statuses,
                          :click_through_conversion_window, :coops_active,
                          :filter_active, :height, :is_active, :name,
                          :organization, :path_name, :product_name,
                          :set_as_default, :statuses, :types, :url,
                          :view_through_conversion_window, :width, :country_code,
                          :is_twitter_syncing, :twitter_handle].freeze

      def create(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def edit(params)
        call_api(:put, __method__, sanitize_params(params))
      end

      def enable_rollcrawl(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def get(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_adgroups(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_adgroups_fast(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_ads(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_ads_fast(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_campaigns(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_campaigns_fast(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      # undocumented
      def get_coops(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_pixel(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_segments(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def set_source(params)
        call_api(:post, __method__, sanitize_params(params))
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
