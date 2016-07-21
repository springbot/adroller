module AdRoll
  class Client
    attr_accessor :user_name, :password, :organization_eid, :debug

    def initialize(user_name:, password:, organization_eid:, debug: false)
      @user_name = user_name
      @password = password
      @organization_eid = organization_eid
      @debug = debug
    end

    def method_missing(meth, *args, &block)
      "AdRoll::Api::#{camelize(meth)}".constantize.new(client: self)
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
