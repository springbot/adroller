require 'adroll/service'

module AdRoll
  module Api
    class Adgroup < AdRoll::Api::Service
      WHITELIST_PARAMS = [:ad, :ad_format, :adgroup, :ads, :campaign, :device,
                          :geo_targets, :geo_targets_countries,
                          :geo_targets_regions, :height, :is_active,
                          :is_negative, :max_age, :min_age, :name,
                          :negative_segments, :os, :os_version, :placement,
                          :placement_targets, :positive_segments, :segments,
                          :site, :status, :statuses, :target_max, :target_min,
                          :type, :types, :width].freeze

      def add_demographic_target(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def add_placement_target(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def add_platform_target(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def add_segments(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def allow_site(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      # undocumented
      def approve_ad(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def clone(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def create(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def deselect_ads(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def edit(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def exclude_site(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_ads(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_geo_targets(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def pause(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def pause_ad(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def pause_ads(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def remove_placement_target(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def remove_platform_target(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def remove_segments(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def select_ads(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def unpause(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def unpause_ad(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def unpause_ads(params)
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
