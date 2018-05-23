require 'adroll/service'

module AdRoll
  module Api
    class ConsentBanner < AdRoll::Api::Service
      WHITELIST_PARAMS = [:advertisable, :state].freeze

      def get
        call_api(:get, __method__, sanitize_params(params))
      end

      def update
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