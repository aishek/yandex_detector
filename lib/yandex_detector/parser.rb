require 'rubygems'

module YandexDetector

  class Parser
    
    class << self

      def parse(result)
        error_present?(result) ? parse_error(result) : parse_success(result)
      end
      
      
      private
          
      def parse_error(result)
        error = match_tag_content(result, YandexDetector::Config::ERROR_TAG_NAME) if result_present?(result)
        {
          :text => result,
          :error => error
        }
      end

      def result_present?(result)
        !result.nil? and !result.strip.empty?
      end

      def error_present?(result)
        !result_present?(result) or result.include?(YandexDetector::Config::ERROR_TAG_NAME)
      end

      def parse_success(result)
        begin
          {
            :text => result,
            :data => {
              :yandex_mobile_info => {
                :name => match_tag_content(result, 'name'),
                :vendor => match_tag_content(result, 'vendor'),
                :device_class => match_tag_content(result, 'device-class'),
                :device_class_desc => match_tag_content(result, 'device-class-desc'),
                :screenx => match_tag_content(result, 'screenx'),
                :screeny => match_tag_content(result, 'screeny'),
                :java => {
                  :cam_access => match_tag_content(result, 'cam-access'),
                  :fs_accesss => match_tag_content(result, 'fs-access'),
                  :certificate_prefix => match_tag_content(result, 'certificate-prefix'),
                  :iconsize => match_tag_content(result, 'iconsize')
                }
              }
            }
          }
        rescue
          parse_error result
        end          
      end
    
      def match_tag_content(result, tagname)
        matches = result.match("<#{tagname}>(.*)</#{tagname}>")
        !matches.nil? and matches.length > 1 ? matches[1] : ""
      end
    
    end
  
  end

end