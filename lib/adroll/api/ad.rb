require 'adroll/service'

module AdRoll
  module Api
    class Ad < AdRoll::Api::Service
      WHITELIST_PARAMS = [:ad, :ad_format, :advertisable, :app_id, :background,
                          :body, :body_dynamic, :call_to_action, :child_ads,
                          :destination_url, :display_url_override,
                          :dynamic_template_id, :file, :headline,
                          :headline_dynamic, :is_fb_dynamic, :lead_gen_form_id,
                          :logo, :message, :message_dynamic,
                          :multi_share_optimized, :multiple_products, :name,
                          :prefix, :product, :tracking, :type].freeze

      def clone(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def create(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def edit(params)
        call_api(:put, __method__, sanitize_params(params))
      end

      def get(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      # undocumented
      def set_outline(params)
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
