module AdRoll
  module Api
    class User < AdRoll::Api::Service
      def deactivate(user:)
        params = {
          user: user
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def edit(u:, username:, first_name:, last_name:, email_preference_general:,
               email_preference_payment:, email_preference_campaign_notifications:)
        params = {
          u: u,
          username: username,
          first_name: first_name,
          last_name: last_name,
          email_preference_general: email_preference_general,
          email_preference_payment: email_preference_payment,
          email_preference_campaign_notifications: email_preference_campaign_notifications
        }.reject { |_, value| value.nil? }

        call_api(:put, __method__, params)
      end

      def get(user:)
        params = {
          user: user
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end

      def grant(u:, advertisables:, organization_role:)
        params = {
          u: u,
          advertisables: advertisables,
          organization_role: organization_role
        }.reject { |_, value| value.nil? }

        call_api(:get, __method__, params)
      end
    end
  end
end
