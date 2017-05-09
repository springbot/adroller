require 'adroll/service'

module AdRoll
  module Api
    class Facebook < AdRoll::Api::Service
      WHITELIST_PARAMS = [:page_url, :account_id, :advertiser_eid].freeze

      def fb_page_url(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def instagram_account(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      private

      def service_url
        'https://services.adroll.com/facebook'
      end

      def sanitize_params(params)
        params.reject do |key, value|
          !WHITELIST_PARAMS.include?(key) || value.nil?
        end
      end
    end
  end
end
