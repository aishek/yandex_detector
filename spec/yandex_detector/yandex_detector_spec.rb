require 'spec_helper'
require 'yandex_detector/detector_spec_helper'

describe YandexDetector do
  include DetectorSpecHelper
  
  it "should provide result on empty" do
    should_provide_result_on empty_headers
  end
  
  it "should raise ArgumentError on empty" do
    expect {
      YandexDetector.detect
    }.to raise_error(ArgumentError)
  end

  it "should apply timeout" do
    result = YandexDetector.detect iphone_headers, 0
    check_properties result, { :request_performed => false, :success => false, :error => true }
  end

  it "should provide result on wrong headers" do
    should_result_on wrong_headers, :request_performed => false, :success => false, :error => true
  end

  it "should provide result and error message on unknown header value" do
    result = should_result_on headers_with_unknown_values, :request_performed => true, :success => false, :error => true
    result.error_message.should_not eql(nil)
  end
  
  it "should no net request perform on empty" do
    should_result_on empty_headers, :request_performed => false, :success => false, :error => true
  end
  
  it "should no net request perform on headers with whitespace-values" do
    should_result_on headers_with_whitespaces_values, :request_performed => false, :success => false, :error => true
  end
  
  it "should provide result on valid" do
    should_result_on valid_headers
  end
  
  it "should provide result on iphone headers" do
    result = should_result_on iphone_headers
    result.iphone?.should eql(true)
  end
  
  it "should provide result on blackberry headers" do
    result = should_result_on blackberry_headers
    result.blackberry?.should eql(true)
  end
  
  it "should provide result on android" do
    result = should_result_on android_headers
    result.android?.should eql(true)
  end

end