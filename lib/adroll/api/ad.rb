require 'adroll/service'

module AdRoll
  module Api
    class Ad < AdRoll::Api::Service
      WHITELIST_PARAMS = [:ad, :advertisable, :name, :destination_url, :file,
                          :headline, :body, :message, :headline_dynamic,
                          :body_dynamic, :message_dynamic, :is_fb_dynamic,
                          :dynamic_template_id, :product, :logo, :background,
                          :call_to_action, :multiple_products, :tracking,
                          :lead_gen_form_id, :multi_share_optimized,
                          :child_ads, :app_id, :ad_format, :prefix,
                          :display_url_override, :type].freeze

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
