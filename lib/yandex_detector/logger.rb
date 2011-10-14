module YandexDetector

  class Result

    class Logger
  
      class << self

        def log(result, request_duration)
          log_info result
          log_info "Request to Yandex.Detector API completed in #{request_duration}"
        end


        private

        def log_info(message)
          Rails.logger.info message if defined?(Rails)
        end

      end
  
    end

  end

end