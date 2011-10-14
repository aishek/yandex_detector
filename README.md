# Introduction

yandex_detector is a Ruby wrapper for Yandex.Detector API (http://api.yandex.ru/detector/) wich allows to detect mobile device's properties by it's request headers.

This document describes installation and usage of yandex_detector.

Please report issues on [Github](https://github.com/aishek/yandex_detector/issues).

For feedback, suggestions, etc. write to <aishek@gmail.com>.

# Installation

To install:

    gem install yandex_detector

or with a Gemfile:

    gem 'yandex_detector'
    bundle install

# Usage

Usage in Rails:

    require 'yandex_detector'

    # API call timeout in seconds (default is 2 seconds)
    timeout = 2

    result = YandexDetector.detect request.headers, timeout

Usage in Ruby program:

    require 'yandex_detector'

    # HTTP headers, you need at least one to perform detect
    headers = Hash.new[
      'user-agent',           'value1'
      'profile',              'value2',
      'wap-profile',          'value3',
      'x-wap-profile',        'value4',
      'x-operamini-phone-ua', 'value1'
    ]
    # API call timeout in seconds (default is 2 seconds)
    timeout = 2

    result = YandexDetector.detect headers, timeout

Result object have following helpers:

    result.error?
    result.error_message
    
    result.success?
    result.iphone?
    result.android?
    result.blackberry?

Please, see [complete list of available helpers](http://rubydoc.info/github/aishek/yandex_detector/master/YandexDetector/Properties).

# Documentation

The [RubyDoc documentation](http://rubydoc.info/github/aishek/yandex_detector/master/frames) is available online.

# How it works

yandex_detector perform Yandex's API service call via network if there are at least one of needed headers provided. Please, consider right timeout value and fallback on timeout for your application to prevent slow execution.

# Author

Idea & implementation&nbsp;— Alexandr Borisov (<aishek@gmail.com>)

# Licence

yandex_detector is licensed under [MIT](https://github.com/afelix/csso/blob/master/MIT-LICENSE.txt)