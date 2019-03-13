module AdRoll
  module Api
    class ProductFeeds < AdRoll::Api::Service
      WHITELIST_PARAMS = [:advertisable, :feed_url, :feedtype, :skipfirstrow,
                          :delimiter, :escapechar, :quotechar, :skipinitialspace,
                          :encoding, :tag_name, :locale, :prices_in_locale_format,
                          :url, :feed_config, :key, :value, :feed_config_edits,
                          :parser_config_edits, :date, :parse_prices_in_locale_format,
                          :language_tag, :parser_configs, :product_data, :is_required,
                          :path, :attribute, :type, :regular_expression, :regular_expression_replace].freeze

      def add_feed_config(params)
        call_api(:put, __method__, nil, sanitize_params(params))
      end

      def autoconfigure(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def delete_feed_config(params)
        call_api(:delete, __method__, sanitize_params(params))
      end

      def delete_parser_config(params)
        call_api(:delete, __method__, sanitize_params(params))
      end

      def edit_configuration(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def edit_feed_config(params)
        call_api(:put, __method__, nil, sanitize_params(params))
      end

      def feed_downloadable(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def feed_status(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_feed_config(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def get_parser_config(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def match_rate(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def parse_preview(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def set_parser_config(params)
        call_api(:post, __method__, sanitize_params(params))
      end

      def set_parser_configs(params)
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
