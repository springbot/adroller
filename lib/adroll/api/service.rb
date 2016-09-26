require 'adroll/service'

module AdRoll
  module Api
    class Service < AdRoll::Service
      def service_url
        File.join(AdRoll::Api.api_base_url, self.class.name.demodulize.underscore)
      end
    end
  end
end
