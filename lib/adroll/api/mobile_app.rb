module AdRoll
  module Api
    class MobileApp < AdRoll::Api::Service
      def create(pixel:, app_name:, os:, app_identifier:, source_type:, source_variant:,
                 verbosity:, mission_elapsed_event_name:, mission_elapsed_time_threshold:)

        params = {
          pixel: pixel,
          app_name: app_name,
          os: os,
          app_identifier: app_identifier,
          source_type: source_type,
          source_variant: source_variant,
          verbosity: verbosity,
          mission_elapsed_event_name: mission_elapsed_event_name,
          mission_elapsed_time_threshold: mission_elapsed_time_threshold
        }.reject { |_, value| value.nil? }

        call_api(:post, __method__, params)
      end

      def delete(mobile_app:)
        params = {
          mobile_app: mobile_app
        }.reject { |_, value| value.nil? }

        call_api(:delete, __method__, params)
      end

      def edit(mobile_app:, app_name:, os:, app_identifier:, source_type:, source_variant:,
               verbosity:, mission_elapsed_event_name:, mission_elapsed_time_threshold:)

        params = {
          mobile_app: mobile_app,
          app_name: app_name,
          os: os,
          app_identifier: app_identifier,
          source_type: source_type,
          source_variant: source_variant,
          verbosity: verbosity,
          mission_elapsed_event_name: mission_elapsed_event_name,
          mission_elapsed_time_threshold: mission_elapsed_time_threshold
        }.reject { |_, value| value.nil? }

        call_api(:put, __method__, params)
      end

      def get(mobile_app:, pixel:, eid:, app_name:, os:, app_identifier:, source_type:, source_variant:,
              configuration:)
        params = {
          mobile_app: mobile_app,
          pixel: pixel,
          eid: eid,
          app_name: app_name,
          os: os,
          app_identifier: app_identifier,
          source_type: source_type,
          source_variant: source_variant,
          configuration: configuration
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end
    end
  end
end
