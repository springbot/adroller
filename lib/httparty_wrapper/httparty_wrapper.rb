class HTTPartyWrapper
  include HTTParty

  # Override httparty default hasherized params
  query_string_normalizer proc { |query|
    query.map do |k, v|
      if v.respond_to? :join
        "#{k}=#{v.join(",")}"
      else
        "#{k}=#{v}"
      end
    end.join("&")
  }
end
