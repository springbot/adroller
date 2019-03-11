3.8.0
Misc.
* Removed some redundant gem versions
* Upgraded httparty to ~> 0.15
* Upgraded factory_girl to ~> 4.8
* Upgraded rubocop to ~> 0.49
* Upgraded activesupport to >= 4.1.11

Breaking Changes
* require Ruby >= 2.0.0 as per httparty 0.15.0
* require >= 4.1.11 activesupport because of security patch

2.0.0
------
New Features
* Added `deliveries_domain` and `segment_deliveries` services from Uhura (#15)
* Updated all services to have a fully comprehensive whitelist based on current documenation (#15)
* Added `get` method to RollcrawlConfiguration service (#15)


Bug Fixes
* Fix dependency issue for non-Rails users (#11)
* Add custom `query_string_normalizer` for HTTParty get requests (#12)

Deprecations
* Removed the `event`, `mobile_app`, `mobile_rule`, and `payment_method` services from API (#15)
*

Misc.
* Updated README formatting (#10)
* Added rubocop to conform to ruby spec (#15)
* Added specs for all services to aid in documentaiton discrepancies (#15)
