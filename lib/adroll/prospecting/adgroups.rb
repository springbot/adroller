module AdRoll
  module Prospecting
    class Adgroups < AdRoll::Prospecting::Service
      WHITELIST_PARAMS = [:ads, :attribute_targets, :attribute_targets_segment, :auto_audience,
                          :auto_geo_targets, :device_targets, :event_source, :geo_targets,
                          :is_active, :name, :user_status, :size, :source_segment_eid, :end_date,
                          :start_date].freeze

      def get(params)
        call_api(:get, path_param(params), {})
      end

      def edit(params)
        call_api(:post, path_param(params), sanitize_params(params))
      end

      def get_audience(params)
        path = File.join(path_param(params), "audience")
        call_api(:get, path, {})
      end

      def edit_audience(params)
        path = File.join(path_param(params), "audience")
        call_api(:post, path, sanitize_params(params))
      end

      def get_flights(params)
        path = File.join(path_param(params), "flights")
        call_api(:get, path, {})
      end

      def edit_flights(params)
        path = File.join(path_param(params), "flights")
        call_api(:post, path, sanitize_params(params))
      end

      def get_geo_targets(params)
        path = File.join(path_param(params), "geo-targets")
        call_api(:get, path, {})
      end

      def edit_geo_targets(params)
        path = File.join(path_param(params), "geo-targets")
        call_api(:post, path, sanitize_params(params))
      end

      private

      def path_param(params)
        params[:adgroup].to_s
      end

      def sanitize_params(params)
        params.reject do |key, value|
          !WHITELIST_PARAMS.include?(key) || value.nil?
        end
      end
    end
  end
end
