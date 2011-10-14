require 'yandex_detector/config'
require 'net/http'
require 'uri'

module YandexDetector

  class Net

    class << self

      def send_detect_request(headers)
        result = nil
        uri = URI.parse(prepare_url(headers))

        if YandexDetector::Config.timeout > 0
          begin
            timeout YandexDetector::Config.timeout do
              result = ::Net::HTTP.get uri
            end        
          rescue
          end
        end
    
        result
      end


      private

      def prepare_url(headers)
        query = headers.collect {|pair| "#{URI.encode_www_form_component(pair[0])}=#{URI.encode_www_form_component(pair[1])}" }.join('&')
        "#{YandexDetector::Config::API_URL}?#{query}"
      end

    end
    
  end

end