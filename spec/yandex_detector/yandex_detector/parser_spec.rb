require 'spec_helper'
require 'yandex_detector/parser_spec_helper'

describe YandexDetector do
  include ParserSpecHelper
  
  describe YandexDetector::Parser do

    it "should return hash" do
      result = YandexDetector::Parser.parse nil
      result.should be_an_instance_of(Hash)
    end
    
    it "should return error key on nil result" do
      result = YandexDetector::Parser.parse nil

      result.should be_an_instance_of(Hash)

      result.should have_key(:error)
      result.should_not have_key(:data)
      
      result.should have_key(:text)
      result[:text].should == nil
    end

    it "should return error key on whitespaces result" do
      result = YandexDetector::Parser.parse result_whitespaces

      result.should be_an_instance_of(Hash)

      result.should have_key(:error)
      result.should_not have_key(:data)
      
      result.should have_key(:text)
      result[:text].should == result_whitespaces
    end
    
    it "should return error text in error tag present" do      
      error_text, xml_text = error_xml_text
      
      result = YandexDetector::Parser.parse xml_text

      result.should be_an_instance_of(Hash)

      result.should have_key(:error)
      result.should_not have_key(:data)

      result[:error].should == error_text
      
      result.should have_key(:text)
      result[:text].should == xml_text
    end
    
    it "should return data key in hash if result passed" do
      result = YandexDetector::Parser.parse result_xml_text

      result.should be_an_instance_of(Hash)

      result.should_not have_key(:error)
      result.should have_key(:data)

      result.should have_key(:text)
      result[:text].should == result_xml_text
    end
    
    it "should return equals hash by data key in hash if result passed" do
      result = YandexDetector::Parser.parse result_xml_text

      result.should be_an_instance_of(Hash)

      result.should_not have_key(:error)
      result.should have_key(:data)
      result[:data].should == result_xml_text_data

      result.should have_key(:text)
      result[:text].should == result_xml_text
    end
    
  end
  
end