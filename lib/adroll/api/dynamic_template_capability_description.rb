module AdRoll
  module Api
    class DynamicTemplateCapabilityDescription < AdRoll::Api::Service
      def get_all
        call_api(:get, __method__, [])
      end
    end
  end
end