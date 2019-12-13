module AdRoll
  module Prospecting
    class Flights < AdRoll::Prospecting::Service
      WHITELIST_PARAMS = [:end_date, :event_source, :start_date].freeze

      def edit(flight_eid, params)
        call_api(:put, flight_eid, sanitize_params(params))
      end

      def delete(flight_eid, params)
        call_api(:delete, flight_eid, sanitize_params(params))
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
