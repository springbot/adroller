require 'httparty'
require 'httmultiparty'

require 'adroll/ad'
require 'adroll/adgroup'
require 'adroll/advertisable'
require 'adroll/campaign'
require 'adroll/event'
require 'adroll/invoice'
require 'adroll/mobile_app'
require 'adroll/mobile_rule'
require 'adroll/organization'
require 'adroll/payment_method'
require 'adroll/pixel'
require 'adroll/report'
require 'adroll/rollcrawl_configuration'
require 'adroll/rule'
require 'adroll/segment'
require 'adroll/service'
require 'adroll/user'

module AdRoll
  module Api
      def self.base_url
        'https://api.adroll.com/v1'
      end

      def self.user_name
        @user_name
      end

      def self.password
        @password
      end

      def self.organization_eid
        @organization_eid
      end

      def self.set_account_data(user_name, password, organization_eid)
        @user_name = user_name
        @password = password
        @organization_eid = organization_eid
      end

    def self.included(base)
      base.class_eval do
        class << self

          def set_account_data(user_name: , password: , organization_eid: )
            AdRoll::Api.set_account_data(user_name, password, organization_eid)
          end

        end
      end
    end
  end
end
