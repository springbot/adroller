require 'json'

module AdRoll
  class Service
    attr_accessor :client

    # Override Object's clone method and pass to method_missing
    def self.clone(params)
      method_missing(:clone, params)
    end

    def self.method_missing(meth, *args)
      # @TODO add logging functionality and put deprecation warnings here
      klass = new
      klass.send(meth, *args)
    end

    def initialize(options = {})
      @client = options.delete(:client)
    end

    def service_method
      AdRoll::Utils.snakecase(self.class.to_s.gsub(/^.*::/, ''))
    end

    private

    def service_url
      raise NotImplementedError
    end

    def basic_auth
      { username: username, password: password }
    end

    def username
      (client && client.user_name) || AdRoll.user_name
    end

    def password
      (client && client.password) || AdRoll.password
    end

    def debug_output
      $stdout if (client && client.debug?) || AdRoll.debug?
    end

    def demo_mode
      Rails.env.demo?
    end

    # Pass in addtional_query_params if you need query parameters on url for 
    # HTTP requests that require you to pass in form body
    def call_api(request_method, endpoint, params, additional_query_params = nil)
      request_uri = File.join(service_url, endpoint.to_s)
      response = make_api_call(request_method, request_uri, params, additional_query_params)
      JSON.parse(response.body)
    rescue JSON::ParserError
      { error: 'JSON::ParserError', response: response.body }
    end

    def make_api_call(request_method, request_uri, params, additional_query_params = nil)
      # Include api_key with every call.
      request_uri << "?apikey=#{AdRoll.api_key}"

      if demo_mode
        make_demo_response(request_method, request_uri, params, additional_query_params)
      elsif request_method == :get
        perform_get(request_method, request_uri, params)
      elsif request_uri.include?('/ad/create?')
        perform_multi_post(request_method, request_uri, params)
      elsif additional_query_params.present?
        perform_post_with_query(request_method, request_uri, params, additional_query_params)
      else
        perform_post(request_method, request_uri, params)
      end
    end

    def perform_get(request_method, request_uri, params)
      # For get requests, format the query params as defined by the AdRoll
      # Spec - lists should be ?param=PARAM1,PARAM2
      ::AdRoll::HTTPartyWrapper.send(request_method,
                                     request_uri,
                                     basic_auth: basic_auth,
                                     query: params,
                                     debug_output: debug_output)
    end

    def perform_multi_post(request_method, request_uri, params)
      HTTMultiParty.send(request_method,
                         request_uri,
                         basic_auth: basic_auth,
                         body: params,
                         debug_output: debug_output)
    end

    def perform_post_with_query(request_method, request_uri, params, additional_query_params)
      HTTParty.send(request_method,
                    request_uri,
                    headers: { 'Content-Type' => 'application/json' },
                    basic_auth: basic_auth,
                    query: additional_query_params,
                    body: params,
                    debug_output: debug_output)
    end

    def perform_post(request_method, request_uri, params)
      # Unfortunately, HTTParty applies query_string_normalizer to `body`
      # as well, so revert back to vanilla HTTParty for other requests.
      HTTParty.send(request_method,
                    request_uri,
                    basic_auth: basic_auth,
                    body: params,
                    debug_output: debug_output)
    end

    def make_demo_response(request_method, request_uri, params, additional_query_params)
      status, data, body_string = demo_response_default
      
      case request_uri
      when /https:\/\/services[.]adroll[.]com\/activate\/api\/v2\/adgroup.*/
        status, data, body_string = demo_response_activate_adgroup(request_method, request_uri, params, additional_query_params) if request_method == :put
      when /https:\/\/services[.]adroll[.]com\/api\/v1\/advertisable\/get.*/
        status, data, body_string = demo_response_advertisable(request_method, request_uri, params, additional_query_params) if request_method == :get
      when /https:\/\/service[.]adroll[.]com\/api\/v1\/facebook\/fb_page_url.*/
        status, data, body_string = demo_response_fb_page_url(request_method, request_uri, params, additional_query_params) if request_method == :get
      when /https:\/\/service[.]adroll[.]com\/api\/api\/v1\/dynamic_template_capability_description\/get_all.*/
        status, data, body_string = demo_response_dynamic_template_capability(request_method, request_uri, params, additional_query_params) if request_method == :get
      when /https:\/\/service[.]adroll[.]com\/api\/v1\/dynamic_template\/get_all_for_advertisable.*/
        status, data, body_string = demo_response_dynamic_template_get_all(request_method, request_uri, params, additional_query_params) if request_method == :get
      end

      demo_response = Net::HTTPOK.new("1.1", status, body_string)
      demo_response.define_singleton_method(:body) { body_string }

      HTTParty::Response.new(HTTParty::Request.new(request_method, request_uri), demo_response, -> { { "data" => data } })
    end

    def demo_response_default
      status = 200
      data = []
      body_string = "{\"message\":\"\",\"status\":#{status},\"data\":\"\"}"
      [status, data, body_string]
    end

    def demo_response_activate_adgroup(request_method, request_uri, params, additional_query_params)
      status = 200
      data = {
        "ad_type" => "string",
        "ads" => [
        ],
        "campaign_eid" => additional_query_params[:eid],
        "eid": "abc",
        "end_date": params['end_date'],
        "name": params['name'],
        "objective": "convert",
        "start_date": params['start_date'],
        "status": params['status'],
      }
      body_string = "{\"message\":\"\",\"status\":#{status},\"data\":#{JSON.dump(data)}}"
      [status, [data], body_string]
    end

    def demo_response_advertisable(request_method, request_uri, params, additional_query_params)
      status = 200
      data = {
        "approval_state" => "",
        "attached_users" => [],
        "blacklisted_sites" => [],
        "business_unit" => "",
        "click_through_conversion_window" => 0,
        "cm_networks" => "",
        "company_phone" => "",
        "created_date" => "",
        "eid" => "",
        "enable_customer_multi_dur_segs" => true,
        "has_approved_consent_solution" => true,
        "has_privacy_policy" => true,
        "iab1_category_id" => 0,
        "iab1_category_name" => 0,
        "iab2_category_id" => 0,
        "iab2_category_name" => 0,
        "iab_content_id" => 0,
        "is_active" => true,
        "is_coop_approved" => true,
        "is_publisher" => true,
        "liquidads" => "",
        "name" => "",
        "ops" => "",
        "optimizer" => "",
        "organization" => "",
        "product_name" => "",
        "saleser" => "",
        "status" => "",
        "updated_date" => "",
        "url" => "",
        "view_through_conversion_window" => 0,
        "zvelo_category_id" => 0,
        "zvelo_category_name" => ""
      }
      body_string = "{\"message\":\"\",\"status\":#{status},\"results\":#{JSON.dump(data)}}"
      [status, [data], body_string]
    end

    def demo_response_fb_page_url(request_method, request_uri, params, additional_query_params)
      status = 200
      data = {
        "fb_page_id" => "123456789",
        "fb_page_img" => "",
        "fb_page_name" => "Fake Page",
        "fb_page_url" => "https://www.facebook.com/FakePage-123456789",
        "is_published" => false,
        "no_profile_picture" => false,
        "page_access" => true,
        "page_admin_access" => true
      }
      body_string = "{\"message\":\"\",\"status\":#{status},\"data\":#{JSON.dump(data)}}"
      [status, [data], body_string]
    end

    def demo_response_dynamic_template_capability(request_method, request_uri, params, additional_query_params)
      status = 200
      results = [
        {
          "is_enabled": true,
          "description": "Promo text",
          "eid": "CHU4RLZSVJCVNG6ZELX2RM",
          "type": null,
          "id": 1,
          "name": "promoText"
        },
        {
          "is_enabled": true,
          "description": "Sale price",
          "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
          "type": null,
          "id": 2,
          "name": "salePrice"
        },
        {
          "is_enabled": true,
          "description": "Yotpo Reviews",
          "eid": "JEX3S2DGJVFITGQT4DP4CT",
          "type": null,
          "id": 5,
          "name": "yotpoReviews"
        },
        {
          "is_enabled": true,
          "description": "Countdown End",
          "eid": "6FIHPHA5ABCI7EKUBAAFHP",
          "type": null,
          "id": 38,
          "name": "countdownEnd"
        }
      ]
      body_string = "{\"message\":\"\",\"status\":#{status},\"results\":#{JSON.dump(results)}}"
      [status, results, body_string]
    end

    def demo_response_dynamic_template_get_all(request_method, request_uri, params, additional_query_params)
      status = 200
      results = [
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "Product Gladiator",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 1,
          "eid": "GYV4ZCRXCZBQZLRTSEMANK",
          "id": 64,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [
            {
              "url": null,
              "description": null,
              "id": 491077,
              "name": "Albert's Apparel",
              "eid": "DHLZVDM7XZHZDLKSJC5OLD"
            }
          ],
          "name": "Maximus",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 2,
          "eid": "YIETL4UC7RDBTIPNDO3BKR",
          "id": 108,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "Enhancer",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 3,
          "eid": "IIZ2EXCWXFHBTIT7ZBHWU3",
          "id": 235,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [
            {
              "url": null,
              "description": null,
              "id": 491077,
              "name": "Albert's Apparel",
              "eid": "DHLZVDM7XZHZDLKSJC5OLD"
            }
          ],
          "name": "Slot Machine",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 7,
          "eid": "DLSTZABMXZBMXHKVSNAUH5",
          "id": 197,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "Classic carousel",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 8,
          "eid": "UEM7NKGSWNBCNLAAMPFRHK",
          "id": 1,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "Duotone carousel",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 9,
          "eid": "VF63IQXOENDI5GGA6B5XRS",
          "id": 2,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [
            {
              "url": null,
              "description": null,
              "id": 491077,
              "name": "Albert's Apparel",
              "eid": "DHLZVDM7XZHZDLKSJC5OLD"
            }
          ],
          "name": "Promo Flip",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 11,
          "eid": "IKGDEIR62ZBYRDWH2EGC6U",
          "id": 214,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [
            {
              "url": null,
              "description": null,
              "id": 491077,
              "name": "Albert's Apparel",
              "eid": "DHLZVDM7XZHZDLKSJC5OLD"
            }
          ],
          "name": "Product Limelight",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 12,
          "eid": "A6YHMZAQ7NAQNJUHYSDNBC",
          "id": 119,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "Promo Messaging",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 14,
          "eid": "F4AAKPQNBNCNHNH66LLXCE",
          "id": 39,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "Classic spotlight",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 15,
          "eid": "W4HHTPMDTNDPLMZZBF6Z7C",
          "id": 0,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "Countdown Timer",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            },
            {
              "is_enabled": true,
              "description": "Countdown End",
              "eid": "6FIHPHA5ABCI7EKUBAAFHP",
              "type": null,
              "id": 38,
              "name": "countdownEnd"
            }
          ],
          "order": 19,
          "eid": "R3CYR24CYZBT3KMBAZCNFC",
          "id": 148,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "*NEW* - Cyber Monday Border",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 20,
          "eid": "65FI34Y5ENBJVLDYNNPOLM",
          "id": 282,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "*NEW* - Black Friday Border",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 21,
          "eid": "JF57EK3JVJGVLCN3KSLMFC",
          "id": 280,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [
            {
              "url": null,
              "description": null,
              "id": 491077,
              "name": "Albert's Apparel",
              "eid": "DHLZVDM7XZHZDLKSJC5OLD"
            }
          ],
          "name": "Holiday Bow 2.0",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 22,
          "eid": "UX2CZHS7DNAYLPE3LWGMS3",
          "id": 201,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [
            {
              "url": null,
              "description": null,
              "id": 491077,
              "name": "Albert's Apparel",
              "eid": "DHLZVDM7XZHZDLKSJC5OLD"
            }
          ],
          "name": "Christmas Tree",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 23,
          "eid": "ON65GKYB5ZH5BMEV2HRRVV",
          "id": 199,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "Holiday Sparkle",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Saleprice",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 24,
          "eid": "S7SC62U2JVH53HLSTSALVW",
          "id": 36,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "*NEW* - Deluxe Timer",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Promo text",
              "eid": "CHU4RLZSVJCVNG6ZELX2RM",
              "type": null,
              "id": 1,
              "name": "promoText"
            },
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            },
            {
              "is_enabled": true,
              "description": "Countdown End",
              "eid": "6FIHPHA5ABCI7EKUBAAFHP",
              "type": null,
              "id": 38,
              "name": "countdownEnd"
            }
          ],
          "order": 25,
          "eid": "FRHHAYZ5CNBNTMWMTNXA4R",
          "id": 284,
          "is_private": false,
          "is_published": true
        },
        {
          "category": null,
          "is_visible": true,
          "allowed_advertisables": [],
          "name": "*NEW* - Retro Snow",
          "in_testing": false,
          "capabilities": [
            {
              "is_enabled": true,
              "description": "Sale price",
              "eid": "RJTMLC5L4ZDVFJSGV3EMOJ",
              "type": null,
              "id": 2,
              "name": "salePrice"
            }
          ],
          "order": 29,
          "eid": "KKMSKTI6AVFCTDOJFTFA62",
          "id": 293,
          "is_private": false,
          "is_published": true
        }
      ]
      body_string = "{\"message\":\"\",\"status\":#{status},\"results\":#{JSON.dump(results)}}"
      [status, results, body_string]
    end
  end
end
