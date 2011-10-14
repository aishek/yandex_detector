module YandexDetector

  class Config

    API_URL = 'http://phd.yandex.net/detect/'
    ERROR_TAG_NAME = 'yandex-mobile-info-error'
  
    # in seconds
    @@timeout = 2
  
    def self.timeout
      @@timeout
    end
  
    def self.timeout=(timeout_value = nil)
      @@timeout = timeout_value if timeout_value.is_a?(Integer)
    end
  
  end

end