module AdRoll
  module Prospecting
    class Adgroups < AdRoll::Prospecting::Service
      WHITELIST_PARAMS = [:ads, :attribute_targets, :attribute_targets_segment, :auto_audience,
                          :auto_geo_targets, :device_targets, :event_source, :geo_targets,
                          :is_active, :name, :user_status, :size, :source_segment_eid, :end_date,
                          :start_date].freeze

      def get(adgroup_eid)
        call_api(:get, adgroup_eid, {})
      end

      def edit(adgroup_eid, params)
        call_api(:post, adgroup_eid, sanitize_params(params))
      end

      def get_audience(adgroup_eid)
        path = File.join(adgroup_eid, "audience")
        call_api(:get, path, {})
      end

      def edit_audience(adgroup_eid, params)
        path = File.join(adgroup_eid, "audience")
        call_api(:post, path, sanitize_params(params))
      end

      def get_flights(adgroup_eid)
        path = File.join(adgroup_eid, "flights")
        call_api(:get, path, {})
      end

      def edit_flights(adgroup_eid, params)
        path = File.join(adgroup_eid, "flights")
        call_api(:post, path, sanitize_params(params))
      end

      def get_geo_targets(adgroup_eid)
        path = File.join(adgroup_eid, "geo-targets")
        call_api(:get, path, {})
      end

      def edit_geo_targets(adgroup_eid, params)
        path = File.join(adgroup_eid, "geo-targets")
        call_api(:post, path, sanitize_params(params))
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
