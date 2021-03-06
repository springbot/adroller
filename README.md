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

When authenticating Facebook, there is an optional parameter you can pass in for the HTTP request method
``` ruby
AdRoll::Api::Facebook.fb_page_url(params, method = :get)
```
The default method is get method, and it expects the request method as symbol name e.g. :post, :get.
Pass in :post when authenticating for first time, and :get once the Facebook page is authenticated


For Universal Campaigns, there are POST/PUT requests that have query strings as well as JSON data.
For HTTP Requests that have JSON data as well as query paramters, pass in the JSON data as the first argument,
and the query parameters second, then finally the HTTP Request method as symbol.

Here are some example to show how to call the universal campaigns endpoints
``` ruby
# GET Request for AdGroup
AdRoll::Api::UniversalCampaigns.adgroup(query_params, method = :get)

# POST Request for AdGroup
AdRoll::Api::UniversalCampaigns.adgroup(json_params, query_params, method = :post)
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


Release
=========

To make a new release of the AdRoller gem:
1. Change the version.rb file to include the new version number
2. Merge your changes to the gem.
3. Click releases at the top of this page
4. Click 'Draft a new release'
5. Enter the new version number as the 'tag version'
6. Add information about what changes in this version
7. Click 'Publish release'
8. Change adroller gem version in the Gemfile where it is being used
