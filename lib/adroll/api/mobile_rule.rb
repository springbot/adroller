module AdRoll
  module Api
    class MobileRule < AdRoll::Api::Service
      def edit(rule:, app_identifier:, event:, os:, device_type:)
        params = {
          rule: rule,
          app_identifier: app_identifier,
          event: event,
          os: os,
          device_type: device_type
        }.reject { |_, value| value.nil? }

        call_api(:put, __method__, params)
      end

      def get(rule:, pixel:, os:, device_type:, app_identifier:, event:, name:)
        params = {
          rule: rule,
          pixel: pixel,
          os: os,
          device_type: device_type,
          app_identifier: app_identifier,
          event: event,
          name: name
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end
    end
  end
end
