module AdRoll
  module Api
    class MobileApp < AdRoll::Api::Service
      WHITELIST_PARAMS = [:app_identifier, :app_name, :configuration, :eid,
                          :mission_elapsed_event_name,
                          :mission_elapsed_time_threshold, :mobile_app, :os,
                          :pixel, :source_type, :source_variant,
                          :verbosity].freeze

      def create(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def delete(params)
        call_api(:delete, __method__, sanitize_params(params))
      end

      def edit(params)
        call_api(:put, __method__, sanitize_params(params))
      end

      def get(params)
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
