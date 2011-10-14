require 'spec_helper'
describe YandexDetector do
  
  describe YandexDetector::Config do
    
    it "should set timeout only for integer" do
      first_value = YandexDetector::Config::timeout
      
      YandexDetector::Config::timeout = nil
      YandexDetector::Config::timeout.should == first_value

      YandexDetector::Config::timeout = 'a'
      YandexDetector::Config::timeout.should == first_value

      YandexDetector::Config::timeout = Object.new
      YandexDetector::Config::timeout.should == first_value

      YandexDetector::Config::timeout = 0.2
      YandexDetector::Config::timeout.should == first_value
      
      YandexDetector::Config::timeout = first_value + 1
      YandexDetector::Config::timeout.should == first_value + 1
    end
    
    it "should define corrent API_URL" do
      YandexDetector::Config::API_URL.should == "http://phd.yandex.net/detect/"
    end
    
    it "should define corrent ERROR_TAG_NAME" do
      YandexDetector::Config::ERROR_TAG_NAME.should == "yandex-mobile-info-error"
    end
    
  end
  
end