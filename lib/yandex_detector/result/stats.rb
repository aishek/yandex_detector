module YandexDetector

  module Stats
 
    private

    def measure
      start = Time.now
      yield
      @request_duration = Time.now - start
    end
    
  end

end