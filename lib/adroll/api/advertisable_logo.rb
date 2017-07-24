require 'adroll/service'

module AdRoll
  module Api
    class AdvertisableLogo < AdRoll::Api::Service
      WHITELIST_PARAMS = [:advertisable, :logo_file].freeze

      def create(params)
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
