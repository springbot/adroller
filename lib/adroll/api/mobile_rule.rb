module AdRoll
  module Api
    class MobileRule < AdRoll::Api::Service
      WHITELIST_PARAMS = [:app_identifier, :device_type, :event, :name, :os,
                          :pixel, :rule].freeze
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
