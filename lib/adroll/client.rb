module AdRoll
  class Client
    attr_accessor :user_name, :password, :organization_eid

    def initialize( user_name:, password:, organization_eid:)
      @user_name = user_name
      @password = password
      @organization_eid = organization_eid
    end

    def method_missing(meth, *args, &block)
      "AdRoll::Api::#{camelize(meth)}".constantize.new(client: self)
    end

    private

    def camelize(string)
      string.to_s.split('_').map(&:capitalize).join
    end
  end
end
