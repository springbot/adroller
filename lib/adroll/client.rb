module AdRoll
  class Client
    attr_accessor :user_name, :password, :organization_eid, :debug

    def initialize(user_name:, password:, organization_eid:,
                   data_source: 'api', debug: false)
      @user_name = user_name
      @password = password
      @organization_eid = organization_eid
      @debug = debug
      @data_source = data_source
    end

    def method_missing(method_name)
      case @data_source
      when 'api'
        "AdRoll::Api::#{camelize(method_name)}".constantize.new(client: self)
      when 'uhura'
        "AdRoll::Uhura::#{camelize(method_name)}".constantize.new(client: self)
      end
    end

    def debug?
      debug
    end

    private

    def camelize(string)
      string.to_s.split('_').map(&:capitalize).join
    end
  end
end
