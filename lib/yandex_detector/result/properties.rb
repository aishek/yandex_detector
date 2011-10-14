module YandexDetector

  module Properties
  
    def request_performed?
      @request_performed
    end
  
  
    def error?
      !request_performed? or @data.nil? or !@data[:error].nil?
    end
    
    def error_message
      begin
        @data[:error]
      rescue
        nil
      end
    end

    def success?
      !error?
    end


    def iphone?
      device_class === 'iphoneos'
    end
  
    def android?
      device_class === 'android'
    end
  
    def blackberry?
      device_class === 'rim'
    end


    def device_class
      begin
        @data[:data][:yandex_mobile_info][:device_class]
      rescue
        nil
      end
    end
        
  end

end