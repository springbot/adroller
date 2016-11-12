module AdRoll
  module Api
    class User < AdRoll::Api::Service
      WHITELIST_PARAMS = [:advertisables,
                          :email_preference_campaign_notifications,
                          :email_preference_general, :email_preference_payment,
                          :first_name, :last_name, :organization_role, :u,
                          :user, :username].freeze

      # undocumented
      def deactivate(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def edit(params)
        call_api(:put, __method__, sanitize_params(params))
      end

      def get(params)
        call_api(:get, __method__, sanitize_params(params))
      end

      def grant(params)
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
