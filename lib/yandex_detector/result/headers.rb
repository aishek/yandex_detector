module YandexDetector

  module Headers
    
    
    private

    def init_headers(headers)
      @headers = create_headers headers
    end

    def headers_present?
      !@headers.empty?
    end
    
    def create_headers(headers)
      result = []

      push_header_if_present result, headers, 'profile'
      push_header_if_present result, headers, 'wap-profile'
      push_header_if_present result, headers, 'x-wap-profile'
      push_header_if_present result, headers, 'user-agent'
      push_header_if_present result, headers, 'x-operamini-phone-ua'

      result
    end
  
    def push_header_if_present(result, headers, header)
      result << [header, headers[header]] unless headers[header].nil? or headers[header].strip.empty?
    end
    
  end

end