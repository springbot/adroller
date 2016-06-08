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
    def self.included(base)
      base.class_eval do
        class << self
          attr_accessor :user_name, :password, :organization_eid

          def base_url
            'https://api.adroll.com/v1'
          end
        end
      end
    end
  end
end
