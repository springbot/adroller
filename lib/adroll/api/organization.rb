module AdRoll
  module Api
    class Organization < AdRoll::Api::Service
      def get(organization: nil)
        params = {
          organization: organization
        }

        call_api(:get, __method__, params)
      end

      def get_advertisables(organization: nil)
        params = {
          organization: organization
        }

        call_api(:get, __method__, params)
      end

      def get_billing_methods(organization: nil)
        params = {
          organization: organization
        }

        call_api(:get, __method__, params)
      end

      def get_users(organization: nil)
        params = {
          organization: organization
        }

        call_api(:get, __method__, params)
      end

      def reset(organization:)
        params = {
          organization: organization
        }

        call_api(:get, __method__, params)
      end
    end
  end
end
