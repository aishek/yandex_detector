module YandexDetector

  # This module contain YandexDetector::Result instance's methods, which allow to determine concrete properties of result
  module Properties
  
    # @return [Bool] network request to API service was performed
    def request_performed?
      @request_performed
    end
  
  
    # @return [Bool] any error occured
    def error?
      !request_performed? or @data.nil? or !@data[:error].nil?
    end
    
    # @return [String, nil] error message if present, or nil otherwise
    def error_message
      begin
        @data[:error]
      rescue
        nil
      end
    end

    # @return [Bool] no error occured
    def success?
      !error?
    end


    # @return [Bool] iphone detected
    def iphone?
      device_class === 'iphoneos'
    end
  
    # @return [Bool] android detected
    def android?
      device_class === 'android'
    end
  
    # @return [Bool] blackberry detected
    def blackberry?
      device_class === 'rim'
    end


    # @return [String, nil] device_class string according to documentation {http://api.yandex.ru/detector/doc/dg/concepts/detector-response.xml}
    def device_class
      begin
        @data[:data][:yandex_mobile_info][:device_class]
      rescue
        nil
      end
    end
    
    # @return [Hash] Hash representation of API service's answer according to documentation {http://api.yandex.ru/detector/doc/dg/concepts/detector-response.xml}.
    #   All '-' signs in tag names replaced by '_' and tag names converted to symbols to use as Hash's keys.
    def data
      begin
        @data[:data]
      rescue
        nil
      end
    end
    
    # @return [String] Text representation of API service's answer according to documentation {http://api.yandex.ru/detector/doc/dg/concepts/detector-response.xml}.
    def text
      begin
        @data[:text]
      rescue
        nil
      end      
    end
    
  end

end