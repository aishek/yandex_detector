# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yandex_detector/version"

Gem::Specification.new do |s|
  s.name        = "yandex_detector"
  s.version     = YandexDetector::VERSION
  s.authors     = ["Alexandr Borisov"]
  s.email       = ["aishek@gmail.com"]
  s.platform    = Gem::Platform::RUBY
  s.homepage    = "http://github.com/aishek/yandex_detector"
  s.summary     = %q{yandex_detector is a gem, wich uses Yandex.Detector API to detect via request's headers.}
  s.description = %q{yandex_detector is a gem, wich uses Yandex.Detector API to detect via request's headers (see http://api.yandex.ru/detector/).}
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.9.2'

  s.rubyforge_project = "yandex_detector"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]  
end