module AdRoll
  class HTTPartyWrapper
    include HTTParty

    # Override httparty default hasherized params
    def self.normalizer_proc
      proc do |query|
        query.map do |k, v|
          if v.respond_to? :join
            v.map! { |item| ERB::Util.url_encode(item.to_s) }
            "#{k}=#{v.join(',')}"
          else
            "#{k}=#{ERB::Util.url_encode(v.to_s)}"
          end
        end.join('&')
      end
    end

    query_string_normalizer normalizer_proc
  end
end
