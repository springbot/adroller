require 'adroll/service'

module AdRoll
  module Api
    class Facebook < AdRoll::Api::Service
      WHITELIST_PARAMS = [:page_url, :account_id]

      class << self
        def service_url
          'https://api.adroll.com/facebook'
        end

        def fb_page_url(params)
          call_api(:post, __method__, validate_params(params))
        end

        def instagram_account(params)
          call_api(:post, __method__, validate_params(params))
        end

        def validate_params(params)
          params.reject { |key, value| !WHITELIST_PARAMS.include?(key) || value.nil? }
        end
      end
    end
  end
end
