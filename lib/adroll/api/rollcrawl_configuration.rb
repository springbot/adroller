module AdRoll
  module Api
    class RollcrawlConfiguration < AdRoll::Api::Service
      def edit(advertisable:, product_id_from_page_scheme: nil, product_id_from_page_regular_expression: nil,
               product_id_from_page_attribute: nil)

        params = {
          advertisable: advertisable,
          product_id_from_page_scheme: product_id_from_page_scheme,
          product_id_from_page_regular_expression: product_id_from_page_regular_expression,
          product_id_from_page_attribute: product_id_from_page_attribute
        }.reject { |_, value| value.nil? }

        call_api(:put, __method__, params)
      end
    end
  end
end
