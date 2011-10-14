module YandexDetector

  class Config

    # URL of API service according documentation {http://api.yandex.ru/detector/doc/dg/concepts/detector-request.xml}
    API_URL = 'http://phd.yandex.net/detect/'
    # Error's tag name according documentation {http://api.yandex.ru/detector/doc/dg/concepts/detector-response.xml}
    ERROR_TAG_NAME = 'yandex-mobile-info-error'
  
    # @private
    @@timeout = 2
  
    # @return [Integer] timeout in seconds to API service call
    def self.timeout
      @@timeout
    end
  
    # Set timeout value to API service call in seconds only if integer value passed
    # @param [Integer] timeout_value specify timeout value in seconds
    def self.timeout=(timeout_value = nil)
      @@timeout = timeout_value if timeout_value.is_a?(Integer)
    end
  
  end

end