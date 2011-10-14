module DetectorSpecHelper
  
  def should_provide_result_on(headers)
    result = YandexDetector.detect headers
    result.should be_an_instance_of(YandexDetector::Result)
    result
  end
  
  def should_result_on(headers, options = { :request_performed => true, :error => false, :success => true })
    result = should_provide_result_on headers
    result = check_properties result, options

    result
  end
  
  def check_properties(result, options = { :request_performed => true, :error => false, :success => true })
    result.request_performed?.should(eql(options[:request_performed]), "request_performed? flag not equals to #{options[:request_performed]}") unless options[:request_performed].nil?
    
    result.error?.should(eql(options[:error]), "error? flag not equals to #{options[:error]}") unless options[:error].nil?
    result.success?.should(eql(options[:success]), "success? flag not equals to #{options[:success]}") unless options[:success].nil?

    result
  end
  
  def android_headers
    Hash[
      'user-agent', 'Mozilla/5.0 (Linux; U; Android 2.3.3; pl-pl; HTC Vision Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1'
    ]
  end
  
  def blackberry_headers
    Hash[
      'user-agent', 'BlackBerry9700/5.0.0.862 Profile/MIDP-2.1 Configuration/CLDC-1.1 VendorID/120'
    ]
  end
  
  def iphone_headers
    Hash[
      'user-agent', 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3'
    ]    
  end
  
  def valid_headers
    Hash[
      'user-agent', 'Alcatel-CTH3/1.0 UP.Browser/6.2.ALCATEL MMP/1.0',
      'wap-profile', 'http://www-ccpp-mpd.alcatel.com/files/ALCATEL-CTH3_MMS10_1.0.rdf'
    ]
  end
  
  def headers_with_unknown_values
    Hash[
      'user-agent', 'unknown'
    ]
  end
  
  def empty_headers
    Hash.new
  end

  def wrong_headers
    Hash['test-header', 'test-value']
  end

  def headers_with_whitespaces_values
    Hash[
      'profile', '',
      'user-agent', "\t\t\n\r\n\r",
      'wap-profile', '            '
    ]
  end

end