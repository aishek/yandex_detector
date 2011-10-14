require "yandex_detector/version"
require "yandex_detector/result"

# @author Alexandr Borisov (aishek@gmail.com)
module YandexDetector
  
  # Performs detectoin by API service call via network if at least one of needed headers specified.
  #
  # @param [Hash] headers string-keyed hash of HTTP headers: 'profile', 'wap-profile', 'x-wap-profile', 'user-agent', 'x-operamini-phone-ua'.
  # @param [Integer, nil] timeout timeout to API service call in seconds
  # @return [YandexDetector::Result] result detecton object
  def self.detect(headers, timeout = 2)
    YandexDetector::Result.new headers, timeout
  end
  
end