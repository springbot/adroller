module AdRoll
  class Utils
    class << self
      def snakecase(str)
        unless str.is_a? String
          raise ArgumentError, "#{str.class.name} is not of type String"
        end

        str.gsub(/::/, '/')
           .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
           .gsub(/([a-z\d])([A-Z])/, '\1_\2')
           .tr('-', '_')
           .downcase
      end
    end
  end
end
