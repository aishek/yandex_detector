require "yandex_detector/version"
require "yandex_detector/result"

module YandexDetector
      
  def self.detect(request, timeout = 1)
    YandexDetector::Result.new request, timeout
  end
  
end