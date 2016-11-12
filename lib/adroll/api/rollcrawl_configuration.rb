module AdRoll
  module Api
    class RollcrawlConfiguration < AdRoll::Api::Service
      WHITELIST_PARAMS = [:advertisable,
                          :product_id_from_page_scheme,
                          :product_id_from_page_regular_expression,
                          :product_id_from_page_attribute].freeze

      def edit(params)
        call_api(:put, __method__, sanitize_params(params))
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
