require 'httparty'
require 'httmultiparty'
require 'active_support/core_ext/string'

require 'adroll/client'
require 'adroll/service'
require 'adroll/utils'

require 'adroll/api/service'
require 'adroll/api/ad'
require 'adroll/api/adgroup'
require 'adroll/api/advertisable'
require 'adroll/api/advertisable_logo'
require 'adroll/api/campaign'
require 'adroll/api/facebook'
require 'adroll/api/invoice'
require 'adroll/api/organization'
require 'adroll/api/pixel'
require 'adroll/api/report'
require 'adroll/api/rollcrawl_configuration'
require 'adroll/api/rule'
require 'adroll/api/segment'
require 'adroll/api/user'

require 'adroll/uhura/service'
require 'adroll/uhura/attributions'
require 'adroll/uhura/deliveries'
require 'adroll/uhura/deliveries/domain'
require 'adroll/uhura/segment_deliveries'
require 'adroll/uhura/userlists'

require 'adroll/httparty_wrapper'

module AdRoll
  def self.api_base_url
    'https://services.adroll.com/api/v1'
  end

  def self.uhura_base_url
    'https://services.adroll.com/uhura/v1'
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

  def self.api_key
    @api_key || ENV['ADROLL_API_KEY']
  end

  def self.organization_eid
    @organization_eid || ENV['ADROLL_ORGANIZATION_EID']
  end

  def self.set_account_data(user_name, password, organization_eid, api_key)
    @user_name = user_name
    @password = password
    @organization_eid = organization_eid
    @api_key = api_key
  end

  def self.uhura_services
    uhura_services = AdRoll::Uhura.constants.select do |c|
      AdRoll::Uhura.const_get(c).is_a?(Class)
    end
    uhura_services - [:Service]
  end

  def self.api_services
    api_services = AdRoll::Api.constants.select do |c|
      AdRoll::Api.const_get(c).is_a?(Class)
    end
    api_services - [:Service]
  end

  def self.uhura_service_classes
    uhura_services.map { |m| "#{AdRoll::Uhura.name}::#{m}".constantize }
  end

  def self.api_service_classes
    api_services.map { |m| "#{AdRoll::Api.name}::#{m}".constantize }
  end

  def self.included(base)
    base.class_eval do
      class << self
        def set_account_data(user_name:, password:, organization_eid:, api_key:)
          AdRoll.set_account_data(user_name, password, organization_eid, api_key)
        end
      end
    end
  end
end
