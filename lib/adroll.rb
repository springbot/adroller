require 'httparty'
require 'httmultiparty'

require 'adroll/api/ad'
require 'adroll/api/adgroup'
require 'adroll/api/advertisable'
require 'adroll/api/campaign'
require 'adroll/api/event'
require 'adroll/api/facebook'
require 'adroll/api/invoice'
require 'adroll/api/mobile_app'
require 'adroll/api/mobile_rule'
require 'adroll/api/organization'
require 'adroll/api/payment_method'
require 'adroll/api/pixel'
require 'adroll/api/report'
require 'adroll/api/rollcrawl_configuration'
require 'adroll/api/rule'
require 'adroll/api/segment'
require 'adroll/api/user'

require 'adroll/client'
require 'adroll/service'
require 'adroll/utils'

module AdRoll
  module Api
    def self.base_url
      'https://api.adroll.com/v1'
    end

    def self.user_name
      @user_name || ENV['ADROLL_USERNAME']
    end

    def self.password
      @password || ENV['ADROLL_PASSWORD']
    end

    def self.debug?
      ENV['DEBUG'] == 'true'
    end

    def self.organization_eid
      @organization_eid || ENV['ADROLL_ORGANIZATION_EID']
    end

    def self.set_account_data(user_name, password, organization_eid)
      @user_name = user_name
      @password = password
      @organization_eid = organization_eid
    end

    def self.services
      self.constants.select { |c| Class === self.const_get(c) } - [:Service]
    end

    def self.service_classes
      services.map { |m| "#{self.name}::#{m}".constantize }
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
