require 'adroll/service'

module AdRoll
  module Prospecting
    class Service < AdRoll::Service
      def service_url
        File.join(AdRoll.prospecting_base_url, self.class.name.demodulize.underscore)
      end
    end
  end
end
