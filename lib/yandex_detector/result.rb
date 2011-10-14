require 'yandex_detector/config'
require 'yandex_detector/net'
require 'yandex_detector/parser'
require 'yandex_detector/logger'

require 'yandex_detector/result/headers'
require 'yandex_detector/result/properties'
require 'yandex_detector/result/stats'

module YandexDetector

  class Result
    include YandexDetector::Headers
    include YandexDetector::Properties
    include YandexDetector::Stats
  
    attr_reader :error, :data, :request_duration
  
    def initialize(request, timeout = 2)
      YandexDetector::Config.timeout = timeout
    
      init_headers request
    
      @request_performed = false
      detect
    end
  
      
    private
      
    def detect
      return unless headers_present?
    
      result = nil
      measure do
        result = YandexDetector::Net.send_detect_request @headers
      end
      
      unless result.nil?
        Logger::log result, request_duration
        @data = YandexDetector::Parser.parse result
        @request_performed = true
      end
    end
          
  end

end