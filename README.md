# Adroller: An API Wrapper for AdRoll [![codecov](https://codecov.io/gh/springbot/adroller/branch/master/graph/badge.svg)](https://codecov.io/gh/springbot/adroller)
========

![alt tag](https://upload.wikimedia.org/wikipedia/commons/8/86/AdRoll.png)

## Documentation
[AdRoll Developer Documentation](https://developers.adroll.com/index.html)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'adroller'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install adroller

## Usage

General Info
============

API version: v1

API base url: https://services.adroll.com/api/v1/

API documentation: https://developers.adroll.com/docs/

Setup
=====

Set your API username, password and organization eid in your environment

```ruby
ENV['ADROLL_USERNAME'] = 'Your User Name'
ENV['ADROLL_PASSWORD'] = 'Your Password'
ENV['ADROLL_ORGANIZATION'] = 'Your Organization eid'
ENV['ADROLL_API_KEY'] = 'Your Developer App apikey'
```

Method Calls
============

This gem uses basic abstraction for the AdRoll services

A method call will return a JSON response directly from the api

```ruby
AdRoll::Api::{Endpoint Name}.{Endpoint Method}({Endpoint Parameters})
```

Example
=========

```ruby
params = {
    name: 'My Advertisable',
    organization: 'FDS32DFA3DK341B4KAL4RK',
    set_as_default: true,
    url: 'http://www.thisisaurl.com',
    product_name: 'My Product'
}

advertisable = AdRoll::Api::Advertisable.create(params)
=> {:name => 'My Advertisable' ... }
```
