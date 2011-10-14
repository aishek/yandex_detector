# encoding: utf-8
module ParserSpecHelper
  
  def error_xml_text
    error_text = 'my brand new error'
    [error_text, "<#{YandexDetector::Config::ERROR_TAG_NAME}>#{error_text}</#{YandexDetector::Config::ERROR_TAG_NAME}>"]
  end
  
  def result_xml_text
    "<yandex-mobile-info>
    <name>One Touch C651</name><!-- название модели телефона -->
    <vendor>Alcatel</vendor><!-- название производителя телефона -->
    <device-class>midp2ss</device-class><!-- класс устройства -->
    <device-class-desc>Java MIDP2 (small)</device-class-desc><!-- описание класса устройства -->
    <screenx>128</screenx><!-- разрешение экрана в пикселах по ширине -->
    <screeny>160</screeny><!-- разрешение экрана в пикселах по высоте -->
    <java><!-- контейнер для Java-параметров -->
        <cam-access>1</cam-access><!-- есть ли у Java-приложений доступ к камере устройства -->
        <fs-access>1</fs-access><!-- есть ли у Java-приложений доступ к файловой системе устройства -->
        <certificate-prefix></certificate-prefix> <!-- префикс Java-сертификата -->
        <iconsize>18x18</iconsize><!-- размер значка Java-приложения -->
    </java> 
</yandex-mobile-info>"
  end
  
  def result_xml_text_data
    {
      :yandex_mobile_info => {
        :name => "One Touch C651",
        :vendor => "Alcatel",
        :device_class => "midp2ss",
        :device_class_desc => "Java MIDP2 (small)",
        :screenx => "128",
        :screeny => "160",
        :java => {
          :cam_access => "1",
          :fs_accesss => "1",
          :certificate_prefix => "",
          :iconsize=>"18x18"
        }
      }
    }
  end
  
  def result_whitespaces
    "\r\n\t\   \n"
  end
  
end