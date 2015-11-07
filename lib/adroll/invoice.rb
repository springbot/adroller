module AdRoll
  module Api
    class Invoice < AdRoll::Api::Service
      class << self
        def get(invoice: )

          params = {
            invoice: invoice
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end
      end
    end
  end
end
