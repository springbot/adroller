  require 'adroll/service'

module AdRoll
  module Api
    class Ad < AdRoll::Api::Service
      WHITELIST_PARAMS = [:ad, :advertisable, :name, :destination_url, :file,
                          :headline, :body, :message, :headline_dynamic,
                          :body_dynamic, :message_dynamic, :is_fb_dynamic,
                          :dynamic_template_id, :product, :logo, :background]

      class << self
        def clone(params)
          call_api(:post, __method__, validate_params(params))
        end

        def create(params)
          call_api(:post, __method__, validate_params(params))
        end

        def edit(params)
          call_api(:put, __method__, validate_params(params))
        end

        def get(params)
          call_api(:get, __method__, validate_params(params))
        end

        def set_outline(params)
          call_api(:get, __method__, validate_params(params))
        end

        def validate_params(params)
          params.reject { |key, value| !WHITELIST_PARAMS.include?(key) || value.nil? }
        end
      end
    end
  end
end
