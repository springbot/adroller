module AdRoll
  module Api
    class RollcrawlConfiguration < AdRoll::Api::Service
      WHITELIST_PARAMS = [:advertisable,
                          :product_id_from_page_scheme,
                          :product_id_from_page_attribute,
                          :product_id_from_page_regular_expression,
                          :product_id_from_page_path,
                          :product_id_from_page_regular_expression_replace,
                          :product_group_from_page_scheme,
                          :product_group_from_page_attribute,
                          :product_group_from_page_regular_expression,
                          :product_group_from_page_path,
                          :product_group_from_page_regular_expression_replace,
                          :feed_url,
                          :feedtype,
                          :skipfirstrow,
                          :delimiter,
                          :escapechar,
                          :quotechar,
                          :skipinitialspace,
                          :encoding,
                          :tag_name,
                          :locale,
                          :prices_in_locale_format].freeze

      def edit(params)
        call_api(:put, __method__, sanitize_params(params))
      end

      def get(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def add_feed_config(params)
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
